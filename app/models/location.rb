class Location < ApplicationRecord
  belongs_to :company
  has_many :products

  validates :name, :address, presence: true
end
