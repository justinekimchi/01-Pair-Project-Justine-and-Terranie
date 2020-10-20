class Customer < ActiveRecord::Base
  has_many :vehicles 
  #has_many :packages through: :services
  has_many :services
end