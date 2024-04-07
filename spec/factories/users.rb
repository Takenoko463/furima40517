FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nick_name { Faker::Name.name }
    name_last_w { person.last.kanji }
    name_first_w { person.first.kanji }
    name_last_r { person.last.katakana }
    name_first_r { person.first.katakana }
    email                 { Faker::Internet.email }
    password              { "1a#{Faker::Internet.password(min_length: 4)}" }
    password_confirmation { password }
    birth_day { Faker::Date.backward }
  end
end
