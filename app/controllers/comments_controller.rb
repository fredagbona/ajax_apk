class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :edit, :update]
  def create
    @comment = @blog.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: 'Impossible de publier ...' }
      end
    end
  end
  def edit
    @comment = @blog.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Modification du commentaire'
      format.js { render :edit }
    end
  end
  def update
    @comment = @blog.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'Commentaire modifié'
          format.js { render :index }
        else
          flash.now[:notice] = 'Échec de la modification du commentaire'
          format.js { render :edit_error }
        end
      end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Commentaire supprimé'
      format.js { render :index }
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end



end
