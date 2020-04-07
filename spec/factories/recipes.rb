FactoryBot.define do
  factory :recipe do
    title              {"オムライス"}
    time               {20}
    serving            {3}
    point              {"美味しい"}
    oneword            {"頑張って"}
    dish_id            {2}
    mainmaterial_id    {2}
    eattime_id         {2}
    # image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg')) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg')) }
  end
end