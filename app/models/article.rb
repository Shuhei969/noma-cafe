# == Schema Information
#
# Table name: articles
#
#  id            :bigint           not null, primary key
#  address       :string
#  content       :text
#  outlet        :integer
#  shop_name     :string           not null
#  shop_url      :text
#  wifi          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  city_id       :bigint
#  prefecture_id :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_articles_on_city_id        (city_id)
#  index_articles_on_prefecture_id  (prefecture_id)
#  index_articles_on_user_id        (user_id)
#
class Article < ApplicationRecord
  enum wifi: { available_wifi: 0, disavailable_wifi: 1 }
  enum outlet: { available_outlet: 0, disavailable_outlet: 1 }

  has_one_attached :eyecatch
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
