class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
    validates :user
    validates :post
  end
end
