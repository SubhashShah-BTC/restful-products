class Var < ActiveRecord::Base
  enum color: [:black, :red, :blue, :white, :green]

  # Associations
  belongs_to :product
  has_and_belongs_to_many :models
end
