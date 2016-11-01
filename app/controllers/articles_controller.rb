class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy]

  def new
    @article = Article.new

    if request.xhr?
      # Form for tag refers to instance variable
      render partial: "form"
    else
      redirect_to article_path(@article)
    end
  end

  def show
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = set_edit_url
      redirect_to article_path(@article)
    else
      @errors = @article.errors.full_messages
      render :new
    end
  end

  def edit
    @article = Article.find_by(edit_key: params[:id])
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to category_path(@article.category)
  end


  private

  def article_params
    params.require(:article).permit(:title, :body, :price, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_edit_url
    edit_article_url(@article.edit_key)
  end

end
