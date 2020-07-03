# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  address        :string
#  auther_comment :string
#  content        :text
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
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
