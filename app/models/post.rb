class Post < ApplicationRecord
  has_many_attached :images
  has_many         :comments, dependent: :destroy
  belongs_to       :user

  with_options presence: true do
    validates :text
    validates :images
    validates :user
  end

  validates :text, length: { maximum: 150, message: "は150文字以下にしてください" }

  def self.search(search)
    if search.to_i == 2
      Post.joins(:user).where("users.gender_id = 2").order("created_at DESC")
    elsif search.to_i == 3
      Post.joins(:user).where("users.gender_id = 3").order("created_at DESC")
    end
  end
end
