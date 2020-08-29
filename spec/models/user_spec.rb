require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "nicknameとgender_idとemailとpasswordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "gender_idが空では登録できない" do
        @user.gender_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("性別を入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'nicknameの文字数が8文字以下ではない場合登録できない' do
        @user.nickname = "testtesttest"
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは8文字以下にしてください")
      end
      it 'gender_idが1以外の場合登録できる' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("性別を選択してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが半角英数字混合でも5文字以下の場合登録できない' do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが6文字以上でも半角英数字混合ではない場合登録できない' do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードに半角英数字を使用してください")
      end
    end
  end
end
