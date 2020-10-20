class Package < ActiveRecord::Base
  # belongs_to :vehicles
  has_many :services
  has_many :vehicles, through: :services
end