class Vehicle < ActiveRecord::Base
  belongs_to :customer
  has_many :services
  has_many :packages, through: :services
end