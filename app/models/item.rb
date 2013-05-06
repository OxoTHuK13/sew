# == Schema Information
#
# Table name: items
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  body                :text
#  price               :float
#  image               :binary
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Item < ActiveRecord::Base
  attr_accessible :title, :body, :price, :image, :avatar

  validates :title, presence: true
  validates :body,  presence: true
  validates :price, presence: true, numericality: {greater_than: 0}

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/assets/rails.png"
end
