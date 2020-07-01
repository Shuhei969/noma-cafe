# == Schema Information
#
# Table name: articles
#
#  id            :bigint           not null, primary key
#  content       :text
#  outlet        :integer
#  shop_url      :text
#  title         :string           not null
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
  enum wifi: { available: 0, none: 1 }
  enum outlet: { available: 0, none: 1 }
  
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
end
