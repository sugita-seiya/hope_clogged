FactoryBot.define do

  factory :report do
    date                  {"4月4日"}
    text                  {"掃除"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end