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
FactoryBot.define do
  factory :article do
    address { Faker::Address.full_address }
    shop_name {Faker::Lorem.characters(number: 10)}
    auther_comment {Faker::Lorem.characters(number: 30)}
    wifi {0}
    outlet {0}
    shop_url {Faker::Lorem.characters(number: 30)}
  end
end
