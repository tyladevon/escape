FactoryBot.define do
  factory :user do
    uid { "" }
    first_name { "MyString" }
    last_name { "MyString" }
    image { "https://s3.amazonaws.com/37assets/svn/765-default-avatar.png" }
    google_token { "MyString" }
    email { "MyString" }
  end
end
