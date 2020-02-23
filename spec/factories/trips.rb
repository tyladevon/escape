FactoryBot.define do
  factory :trip do
    name { "MyString" }
    destination_name { "MyString" }
    destination_address { "MyString" }
    lat { 1.5 }
    lng { 1.5 }
    user
  end
end
