class Vehicle < ActiveRecord::Base
  belongs_to :customer
  has_many :services  
end