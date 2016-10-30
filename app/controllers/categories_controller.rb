class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(:name)
  end

  def show
  end

end
