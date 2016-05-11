class Category < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  has_and_belongs_to_many :products

  def self.find_by_another_category
    puts "this is testing"
  end
end
