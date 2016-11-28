class Shipment < ApplicationRecord
  has_many :guides, dependent: :destroy
end
