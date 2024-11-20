class PostsController < ApplicationController
  def index
    posts = policy_scope(Post).with_attached_attachments.order(created_at: :desc)
    render json: posts.map { |post| PostSerializer.call(post) }
  end

  def show
    authorize post
    render json: PostSerializer.call(post)
  end

  def create
    post = Post.create!(permitted_attributes(Post))
    authorize post
    post.post_users.create!(user_id: current_user.id, owner_boolean: true)

    attach_files(post)

    render json: PostSerializer.call(post), status: :created
  end

  def update
    authorize post
    post.update!(permitted_attributes(Post))

    attach_files(post)

    render json: PostSerializer.call(post), status: :ok
  end

  def destroy
    authorize post
    post.destroy
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def attach_files(post)
    return unless params[:post][:attachments].present?
    Array(params[:post][:attachments]).each do |attachment|
      post.attachments.attach(attachment)
    end
  end
end
