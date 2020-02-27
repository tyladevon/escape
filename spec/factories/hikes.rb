FactoryBot.define do
  factory :hike do
    name { "MyString" }
    rid { "" }
    summary { "MyString" }
    difficulty { "MyString" }
    stars { 1 }
    location { "MyString" }
    length { 1.5 }
    ascent { 1 }
    descent { 1 }
    lat { 1.5 }
    lng { 1.5 }
    url { "MyString" }
    high { 1 }
    low { 1 }
  end
end
