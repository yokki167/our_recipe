require 'rails_helper'
describe Recipe do
  before do
    @user = create(:user)
  end
  # let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  # let(:image) { Rack::Test::UploadedFile.new(image_path) }
  describe "#create" do
    it "タイトル、完成後の写真、所要時間、何人前が存在すれば登録できること" do
      # @user = create(:user)
      recipe = build(:recipe, user_id:@user.id)
      expect(recipe).to be_valid
    end
    it "タイトルがないと無効" do
      recipe = build(:recipe, user_id:@user.id, title: "")
      recipe.valid?
      expect(recipe.errors[:title]).to include("を入力してください")
    end
    it "完成後の写真がないと無効" do
      recipe = build(:recipe, user_id:@user.id, image: "")
      recipe.valid?
      expect(recipe.errors[:image]).to include("を入力してください")
    end
    it "所要時間がないと無効" do
      recipe = build(:recipe, user_id:@user.id, time: "")
      recipe.valid?
      expect(recipe.errors[:time]).to include("を入力してください")
    end

    it "何人前がないと無効" do
      recipe = build(:recipe, user_id:@user.id, serving: "")
      recipe.valid?
      expect(recipe.errors[:serving]).to include("を入力してください")
    end
    it "タイトルが40文字以上であれば登録できないこと" do
      recipe = build(:recipe, user_id:@user.id, title: "あああああああああああああああああああああああああああああああああああああああああ")
      recipe.valid?
      expect(recipe.errors[:title]).to include("は40文字以内で入力してください")
    end
    it "タイトルが40文字未満であれば登録できること" do
      recipe = build(:recipe, user_id:@user.id, title: "あああああああああああああああああああああ")
      expect(recipe).to be_valid
    end
    it "一言が55文字以上であれば登録できないこと" do
      recipe = build(:recipe, user_id:@user.id, oneword: "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
      recipe.valid?
      expect(recipe.errors[:oneword]).to include("は55文字以内で入力してください")
    end
    it "一言が55文字未満であれば登録できること" do
      recipe = build(:recipe, user_id:@user.id, oneword: "あああああああああああああああああああああ")
      expect(recipe).to be_valid
    end
  end
end