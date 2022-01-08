FactoryBot.define do
  factory :user do
    email { 'ladydanbury@bridgerton.com' }
    password { 'password12345' }
    password_confirmation { 'password12345' }
  end
end