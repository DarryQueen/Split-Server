class Meal < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :items
  has_many :memberships

  attr_accessible :name, :tax, :tip, :latitude, :longitude
end
