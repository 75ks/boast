require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント' do
    context 'コメントがうまくいくとき' do
      it 'textが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントがうまくいかないとき' do
      it 'textが空では登録できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("テキストを入力してください")
      end
      it 'textの文字数が50文字以下ではない場合登録できない' do
        @comment.text = "テストです。テストです。テストです。テストです。テストです。テストです。テストです。テストです。テストです。"
        @comment.valid?
        expect(@comment.errors.full_messages).to include("テキストは50文字以下にしてください")
      end
    end
  end
end
