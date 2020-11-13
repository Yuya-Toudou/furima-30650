class Buy < ApplicationRecord
  belongs_to :item
  has_one :delivery_destination
end
