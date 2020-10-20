class Package < ActiveRecord::Base
  # belongs_to :vehicles
  has_many :services
end