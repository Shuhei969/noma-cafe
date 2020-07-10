# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  address        :string
#  auther_comment :string
#  content        :text
#  latitude       :float
#  longitude      :float
#  outlet         :integer
#  shop_name      :string           not null
#  shop_url       :text
#  wifi           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :bigint           not null
#  prefecture_id  :bigint
#  user_id        :bigint           not null
#
# Indexes
#
#  index_articles_on_area_id        (area_id)
#  index_articles_on_prefecture_id  (prefecture_id)
#  index_articles_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id)
#
class Article < ApplicationRecord
  # validate :eyecatch_count_validation

  enum wifi: { available_wifi: 0, disavailable_wifi: 1 }
  enum outlet: { available_outlet: 0, disavailable_outlet: 1 }
  has_many :likes, dependent: :destroy
  has_many_attached :eyecatchs, dependent: :destroy
  belongs_to :user
  belongs_to :prefecture
  # belongs_to :city
  belongs_to :area

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def like_count
    likes.count
  end

  # def eyecatch_count_validation
  #   eyecatch_validation = eyecatchs #validatesの時と違って、:tag_listとしないところを注意
  #   eyecatch_validation.split(",")
  #   if eyecatch_validation.length >3
  #     errors.add(:eyecatchs, "画像は３個までです")
  #   end
  # end
end
