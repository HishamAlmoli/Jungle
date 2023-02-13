class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @categories_count = Category.count

    p @categories_count
    p @product_count
  end
end
