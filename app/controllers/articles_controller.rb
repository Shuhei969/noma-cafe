class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    
    # ----下記は検索フォーム用に記述----
    @prefectures = Prefecture.all
    @areas = Area.all
    @q = @articles.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def show
    @article = Article.find(params[:id])
    @api_key = ENV['GOOGLE_MAP_KEY']
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
    # 画像関連
    # @article.eyecatchs.detach
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  # def upload_eyecatch
  #   @eyecatch_blob = create_blob(params[:eyecatch])
  #   respond_to do |format|
  #     format.json { @eyecatch_blob }
  #   end


  
  # ---------------------------------------ransack---------------------------------------
  def search
    @q = Article.search(search_params)
    @articles = @q.result(distinct: true)
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
      :auther_comment,
      :latitude,
      :longitude,
      eyecatchs: []
    )
  end
end
  
  # def uploaded_eyecatchs
  #   params[:article][:eyecatchs].map{|id| ActiveStorage::Blob.find(id)} if params[:article][:eyecatchs]
  # end

  # def set_article
  #   @article = Article.with_attached_eyecatchs.find(params[:id])
  # end


  # def create_blob(uploading_file)
  #   ActiveStorage::Blob.create_after_upload! \
  #     io: uploading_file.open,
  #     filename: uploading_file.original_filename,
  #     content_type: uploading_file.content_type
  # end


  # ---------------------------------------ransack---------------------------------------
  def search_params
    params.require(:q).permit!
  end

