class Item < ActiveRecord::Base
  attr_accessible :name, :price
  belongs_to :meal, :presence => true
  has_many :users, :through => :consumptions

end
