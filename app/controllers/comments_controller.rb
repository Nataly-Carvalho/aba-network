class CommentsController < ApplicationController
  before_action :comment, only: %i[show]

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
    render json: @comments
  end

  def show
    authorize @comment
    render json: @comment
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end
end
