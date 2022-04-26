class Cook < ApplicationRecord
  has_one_attached :image
  # cookcommentsモデルと1:n
  has_many :cook_comments, dependent: :destroy
  belongs_to :genre
  belongs_to :customer
  # favoritesモデルと1:n
  has_many :favorites, dependent: :destroy
  #reviewsモデルと1:n レビュー機能
  has_many :reviews, dependent: :destroy

  #特定の処理で名前を呼び出せる
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimageフォト.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  #レビューの平均
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  #レビューの％
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/3
    else
      0.0
    end
  end

end
