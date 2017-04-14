FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password '123456'
    password_confirmation '123456'

    trait :admin do
      role User.roles[:admin]
    end

    trait :user do
      role User.roles[:user]
    end
  end
end

# create(:user, :admin)
