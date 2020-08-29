class Post < ApplicationRecord
  has_many_attached :images
  has_many         :comments
  belongs_to       :user

  with_options presence: true do
    validates :text
    validates :images
    validates :user
  end

  validates :text, length: { maximum: 150, message: "は150文字以下にしてください" }
end
