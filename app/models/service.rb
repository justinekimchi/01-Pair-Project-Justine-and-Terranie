class Service < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :package
end