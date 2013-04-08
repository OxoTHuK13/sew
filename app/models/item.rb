class Item < ActiveRecord::Base
  attr_accessible :title, :body, :price, :image
end
