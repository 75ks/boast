class Post < ApplicationRecord
  has_one_attached :image
  belongs_to       :user

  with_options presence: true do
    validates :text
    validates :image
    validates :user
  end
end
