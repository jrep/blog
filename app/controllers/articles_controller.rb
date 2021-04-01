class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "This is not the title", body: "The body. Or, something like it.")

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
