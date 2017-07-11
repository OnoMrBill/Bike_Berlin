class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user
    logger.debug "CommentsController @product.id: #{@product.id}"
    logger.debug "CommentsController @comment.body: #{@comment.body}"
    logger.debug "CommentsController @comment.user.id: #{@comment.user.id}"
    # logger.debug "CommentsController current_user: #{@comment.user[:user].email}"
    # @user = User.find(@comment.user.id)
    logger.debug "CommentsController @user.email: #{@user.email}"
    logger.debug "CommentsController @user.first_name: #{@user.first_name}"
    respond_to do |format|
      if @comment.save
        @product.set_latest_reviewer("#{@user.first_name}")
        # ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        # The broadcast_to method has to be called on a channel class. 
        # It expects at least two arguments. The first argument is the specific model you want to broadcast to. 
        # The following argument contains the actual data you're broadcasting. 
        # Since we use the product_id for the channel instead of the actual product object we broadcast to @product.id and not just @product.
        # ProductChannel.broadcast_to @product.id, comment: @comment, average_rating: @product.average_rating
        # ProductChannel.broadcast_to @product.id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: @comment}), average_rating: @product.average_rating
        # ProductChannel.broadcast_to @product.id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: @comment, current_user: current_user}), average_rating: @product.average_rating
        # Rails 5 comes with another new feature that lets you render views outside of the controller action context. 
        # As you can see in the line of code above, you are now able to call the render method directly on a specific controller class. 
        # You can render a template from the views folder simply by writing .render(products/index), 
        # a controller action with .render(:index), a specific file path with .render(file: 'path/to/file') 
        # or plain HTML ERB code: .render(inline: 'two plus three equals <%= 2 + 3 %>').
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
