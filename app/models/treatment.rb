class Treatment < ApplicationRecord
  validates_presence_of :name, :price, :desc
end
