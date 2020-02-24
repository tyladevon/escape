FactoryBot.define do
  factory :climb do
    route_id { 123456 }
    name { "MyString" }
    climb_type { "Sport" }
    rating { "MyString" }
    stars { 1.5 }
    pitches { 1 }
    lat { 1.5 }
    lng { 1.5 }
    url { "MyString" }
  end
end
