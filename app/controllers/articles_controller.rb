class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '投稿を保存しました'
    else
      flash.now[:error] = '投稿の保存に失敗しました'
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(
      :shop_name,
      :prefecture_id,
      :city_id,
      :address,
      :wifi,
      :outlet,
      :content,
      :shop_url
    )
  end
end
