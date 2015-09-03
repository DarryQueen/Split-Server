class Consumption < ActiveRecord::Base
  belongs_to :membership, :presence => true
  has_one :user, :through => :memberships
  has_one :meal, :through => :memberships

end
