FactoryGirl.define do

  factory :user do
    full_name 'Alice Foo'
    email 'fake@fakemail.com'
    password 'password123'
    password_confirmation 'password123'
  end
end
