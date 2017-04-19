FactoryGirl.define do
  factory :auth_provider do
    user
    provider 'facebook'
    uid '123123'
  end
end
