class Service < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :package
end