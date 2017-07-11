class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  logger.debug "inside CommentsController..."

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    logger.debug "CommentsController @product.id: #{@product.id}"
    logger.debug "CommentsController @comment.body: #{@comment.body}"
    logger.debug "CommentsController @comment.user.id: #{@comment.user.id}"
    # logger.debug "CommentsController current_user: #{@comment.user[:user].email}"
    @user = User.find(@comment.user.id)
    logger.debug "CommentsController @user.email: #{@user.email}"
    logger.debug "CommentsController @user.first_name: #{@user.first_name}"
    respond_to do |format|
      if @comment.save
        @product.set_latest_reviewer("#{@user.first_name}")
        ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    # @comment = Comment.find(params[:id])
    # product = @comment.product
    logger.debug "comment.id to be deleted: #{@comment.id}"
    logger.debug "about to delete comment..."
    logger.debug "product comment is being deleted from: #{@product}"
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }    
    end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @product = Product.find(params[:product_id])
      @comment = @product.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	  def comment_params
	    params.require(:comment).permit(:user_id, :body, :rating)
	  end
  
end
