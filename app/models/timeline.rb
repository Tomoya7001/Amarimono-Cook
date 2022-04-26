class Timeline < ApplicationRecord
  has_many :cooks, dependent: :destroy
  # favoritesモデルと1:n
  has_many :favorites, dependent: :destroy
end
