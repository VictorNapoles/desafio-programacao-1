class Item < ApplicationRecord
  belongs_to :purchaser
  belongs_to :product
  belongs_to :merchant
end
