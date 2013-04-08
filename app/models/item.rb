# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  price      :float
#  image      :binary
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :title, :body, :price, :image

  validates :title, :body, :price, presence: true
end
