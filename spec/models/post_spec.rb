require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload("app/assets/images/post-1.png")
  end

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it 'textとimageが存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'textが空では登録できない' do
        @post.text = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
