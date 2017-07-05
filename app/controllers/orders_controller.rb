class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    logger.debug "inside OrdersController create method..."
  end

  def destroy
  end

end