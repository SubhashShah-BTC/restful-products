class Model < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  has_and_belongs_to_many :vars
end
