# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc).limit(5)
  end

  def temp
    redirect_to root_path
  end
end
