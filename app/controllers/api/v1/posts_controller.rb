module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.order('created_at DESC')
        render json: { success: true, message: 'Loaded all posts', data: { posts: @posts } }, status: :ok
      end
    end
  end
end
