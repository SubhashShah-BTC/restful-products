class Product < ActiveRecord::Base

  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories
  has_one :var, dependent: :destroy
  has_many :images, dependent: :destroy
end
