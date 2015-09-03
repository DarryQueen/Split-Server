class Meal < ActiveRecord::Base
  attr_accessible :name, :tax, :tip, :latitude, :longitude
  has_many :users, :through => :memberships
  has_many :items
  has_many :memberships

end
