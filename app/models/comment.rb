class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
    validates :text
    validates :user
    validates :post
  end

  validates :text, length: { maximum: 50, message: "は50文字以下にしてください" }
end
