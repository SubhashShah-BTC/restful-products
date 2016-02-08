class Product < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories
  has_many :vars, dependent: :destroy
  has_many :images, dependent: :destroy

  # Instance methods

end
