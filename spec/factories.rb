FactoryGirl.define do
  factory :user do
    email 'dummy@gmail.com'
    password 'superpassword'
    role UserRoles.initial_role

    factory :admin do
      after(:build) do |user|
        user.role = UserRoles.admin
      end
    end
  end
end
