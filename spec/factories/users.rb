FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name           { person.last.kanji }
    first_name            { person.first.kanji }
    family_name_kana      { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birth_day             { Faker::Date.birthday }
  end
end
