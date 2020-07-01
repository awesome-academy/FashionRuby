class CommentsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
    def create
      @comment = current_user.comment.build comment_params
      @comment.save
      respond_to do |format|
      format.html {render(partial: 'comment', locals: { comment: @comment})}
      format.js
      format.json {render json: @comment }
    end
  end

     def show
    @product= Product.find params[:id]
    @comments = @product.comments
    @comment = @product.comments.build
     end

     def edit
     @comment = Comment.find params[:id]
     @products= Product.all
     @product= Product.find params[:id]
     end

     def update
     @comment = Comment.find params[:id]
     @comment.update
      respond_to do |format|
      format.html {render(partial: 'comment', locals: { comment: @comment})}
      format.js
      format.json {render json: @comment }
    end
  end

    def destroy
      @comment = Comment.find params[:id]
      @comment.destroy
      flash[:success] = t("global.canpaigs.delete")
      respond_to do |format|
      format.html
      format.js
      format.json {render json: {result: "OK"} }
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:content, :product_id)
    end

    def correct_user
      @comment = current_user.comment.find_by id: params[:id]
    end
  end
