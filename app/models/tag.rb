class Tag < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  has_and_belongs_to_many :products
end
