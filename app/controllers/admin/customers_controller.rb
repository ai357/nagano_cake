class Admin::CustomersController < ApplicationController

  def new
  end

  def index
    @customers = Customer.all
    @page = Post.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

end
