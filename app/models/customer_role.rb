class UserRole < ApplicationRecord
  belongs_to :customer
  belongs_to :role
end