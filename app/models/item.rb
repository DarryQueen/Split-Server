class Item < ActiveRecord::Base
  belongs_to :meal, :presence => true
  has_many :users, :through => :consumptions

  attr_accessible :name, :price
end
