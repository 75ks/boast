class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  has_many               :posts, dependent: :destroy
  has_many               :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :gender_id
  end

  validates :email, uniqueness: true
  
  validates :nickname, length: { maximum: 8, message: "は8文字以下にしてください" }

  validates :gender_id, numericality: { other_than: 1, message: "を選択してください" }

  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, presence: true, format: { with: half_width_alphanumeric, message: "に半角英数字を使用してください" }
end
