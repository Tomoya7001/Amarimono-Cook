class Role < ApplicationRecord
  has_many :customers, through: :customer_roles
  validates :name, presence: true
end