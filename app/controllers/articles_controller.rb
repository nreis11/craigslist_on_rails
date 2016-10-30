class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      @errors = @article.errors.full_messages 
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to category_path(@article.category)
  end


  private

  def article_params
    params.require(:article).permit(:title, :body, :price, :category_id)
  end

end
