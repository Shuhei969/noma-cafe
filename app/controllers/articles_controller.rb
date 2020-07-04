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

  def edit
    # @article = Article.find(params[:id])
    # before_actionによりアクション内の記載は削除して省略
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end


  private
  def article_params
    params.require(:article).permit(
      :shop_name,
      :prefecture_id,
      :area_id,
      :address,
      :wifi,
      :outlet,
      :content,
      :shop_url,
      :eyecatch,
      :auther_comment
    )
  end
end
