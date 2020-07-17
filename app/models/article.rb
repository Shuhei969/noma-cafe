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
#  user_id        :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :eyecatchs, length: { maximum: 3 }
  validates :auther_comment, length: { maximum: 240 }
  validates :shop_name, presence: true
  validates :address, presence: true
  
  enum wifi: { available_wifi: 0, disavailable_wifi: 1 }
  enum outlet: { available_outlet: 0, disavailable_outlet: 1 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :eyecatchs, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def like_count
    likes.count
  end

  def comment_count
    comments.count
  end
end
