class ArticlesController < ApplicationController
  
  def index
    params[:q] ||= HashWithIndifferentAccess.new
    params[:q][:shop_name_or_address_cont_all] = params[:q][:shop_name_or_address_cont_all].try { |prm| prm.split(/[[:blank:]]/) }
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).order(id: 'DESC')
    # 初期表示は検索条件なし全件表示として表示する
  end

  def show
    @article = Article.find(params[:id])
    @api_key = ENV['GOOGLE_MAP_KEY']
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '投稿しました'
    else
      # flash.now[:error] = '投稿の保存に失敗しました'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    # 画像関連
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      # flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(
      :shop_name,
      :address,
      :wifi,
      :outlet,
      :content,
      :shop_url,
      :auther_comment,
      :latitude,
      :longitude,
      eyecatchs: []
    )
  end
end
