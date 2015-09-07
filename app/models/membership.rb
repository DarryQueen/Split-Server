class Membership < ActiveRecord::Base
  DEFAULT_ROLE = :participant

  belongs_to :user
  belongs_to :meal

  before_save :default_values

  validates :user, :presence => true
  validates :meal, :presence => true

  attr_accessible :role

  def default_values
    self.role ||= DEFAULT_ROLE
  end
end
