class Consumption < ActiveRecord::Base
  belongs_to :membership, :presence => true
  has_one :user, :through => :membership
  has_one :meal, :through => :membership
end
