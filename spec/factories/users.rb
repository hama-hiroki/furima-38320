FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '中田' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'ナカタ' }
    birthday              { '1936-08-09' }
  end
end
