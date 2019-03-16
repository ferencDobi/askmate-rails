require 'rails_helper'

describe SessionController do
  describe 'POST #create' do
    let(:login_params) do
      { user: { username: 'TestUser', password: 'password' } }
    end

    context 'when the credentials are wrong' do
      before do
        request.headers[:HTTP_REFERER] = '/some_page'
        post :create, params: login_params
      end

      it 'should redirect back to the same page' do
        expect(response).to redirect_to('/some_page')
      end

      it 'should not log the user in' do
        expect(controller.current_user).to eq nil
      end

      it 'should set an error message' do
        expect(flash[:error]).to eq 'Invalid username or password.'
      end
    end

    context 'when the credentials are right' do
      let!(:user) { create :user, username: login_params[:user][:username] }

      before do
        request.headers[:HTTP_REFERER] = '/some_page'
        post :create, params: login_params
      end

      it 'should redirect back to the same page' do
        expect(response).to redirect_to('/some_page')
      end

      it 'should create a session' do
        expect(controller.current_user).to eq user
      end

      it 'should not set an error message' do
        expect(flash[:error]).to eq nil
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      request.headers[:HTTP_REFERER] = '/some_page'
      user = create :user
      post :create, params: {
        user: { username: user[:username], password: user[:password] }
      }
      delete :destroy
    end

    it 'should redirect back to the same page' do
      expect(response).to redirect_to('/some_page')
    end

    it 'should clear the session' do
      expect(controller.current_user).to eq nil
    end
  end
end