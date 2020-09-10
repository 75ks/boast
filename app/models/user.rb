class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  has_many               :posts, dependent: :destroy
  has_many               :comments, dependent: :destroy
  has_many               :favorites, dependent: :destroy
  has_many               :favorite_posts, through: :favorites, source: :post
  has_many               :relationships
  has_many               :followings, through: :relationships, source: :follow
  has_many               :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many               :followers, through: :reverse_of_relationships, source: :user

  with_options presence: true do
    validates :nickname
    validates :gender_id
  end

  validates :email, uniqueness: true
  
  validates :nickname, length: { maximum: 8, message: "は8文字以下にしてください" }

  validates :gender_id, numericality: { other_than: 1, message: "を選択してください" }

  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, presence: true, format: { with: half_width_alphanumeric, message: "に半角英数字を使用してください" }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
