# == Schema Information
#
# Table name: areas
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :bigint           not null
#
# Indexes
#
#  index_areas_on_prefecture_id  (prefecture_id)
#
class Area < ApplicationRecord
  belongs_to :prefecture
  # has_many :articles
end
