class Customer < ActiveRecord::Base
  has_many :vehicles 
  #has_many :packages through: :services
  # has_many :services
  # has_many :packages , through: :services
end