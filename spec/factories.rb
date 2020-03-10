FactoryBot.define do
  service_array = ["Test Service", "Test Service Two"]
  letter = ["a", "b", "c", "d"]
  factory :random_question, class: Movie do
    name { Faker::Zootipia }
    user_id { Faker::Lorem.sentence }
    service { service_array.sample }
    number { Faker::Number.between(1, 2) }
    letter { letter.sample }
    preview_video_url { }
  end
end