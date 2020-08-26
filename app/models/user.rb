class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  has_many               :posts

  with_options presence: true do
    validates :nickname
    validates :gender_id
  end

  validates :gender_id, numericality: { other_then: 1 }
end
