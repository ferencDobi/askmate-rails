class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params.merge(user_id: @current_user&.id))

    redirect_to question_path(@answer.question) if @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:message, :image, :question_id)
  end
end
