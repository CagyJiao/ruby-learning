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
    @article = Article.new(title: "...", body: "...")

    if @article.save
      # it will cause to make a new request 
      redirect_to @article
    else
      # render the specified view for the current request
      render :new
    end
  end

end
