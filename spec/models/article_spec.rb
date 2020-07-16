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
