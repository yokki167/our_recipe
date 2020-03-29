require 'rails_helper'
describe Recipe do
  describe "#create" do
    it "is invalid without a title" do
      recipe = Recipe.new(title: "", image: "オムライス.jpg", time: "15",
      serving: "3", worktime: "13")
      recipe.valid?
      expect(recipe.errors[:title]).to include("can't be blank")
    end
  end
end