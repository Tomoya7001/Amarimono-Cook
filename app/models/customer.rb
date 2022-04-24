class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  # cookモデルと1:n
  has_many :cooks, dependent: :destroy
  # favoritesモデルと1:n
  has_many :favorites, dependent: :destroy
  # memosモデルと1:n
  has_many :memos, dependent: :destroy
  #reviewsモデルと1:n レビュー機能
  has_many :reviews, dependent: :destroy
  #cancancan利用　ゲストユーザー制限の為
  has_many :roles, through: :user_roles
  # relationshipsモデルと1:n フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で利用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, uniqueness: true, length: { minimum:2,maximum:20 }

  # フォローしたときの処理
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外すときの処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end

  def is_followed_by?(customer)
    reverse_of_relationships.find_by(follower_id: customer.id).present?
  end

  # ゲストログイン用
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@guest.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
    end
  end

  # プロフィール画像用
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
