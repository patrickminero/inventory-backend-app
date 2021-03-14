class Location < ApplicationRecord
  belongs_to :company
  has_many :products
  has_many :users
end
