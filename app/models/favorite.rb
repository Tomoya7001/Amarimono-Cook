class Favorite < ApplicationRecord
  # belongs_to :timeline
  belongs_to :customer
  belongs_to :cook

end
