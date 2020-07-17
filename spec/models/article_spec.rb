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
require 'rails_helper'

RSpec.describe Article, type: :model do
  # create(:シンボル) シンボルはfactories/ファイル内のシンボルと連動して撮ってきている
  let!(:user) { create(:user) }
  
  context '内容が記入されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end
end
