class Membership < ActiveRecord::Base
  attr_accessible :role
  belongs_to :user, :presence => true
  belongs_to :meal, :presence => true

end
