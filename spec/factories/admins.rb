FactoryBot.define do
  factory :admin, class: User do
    username "admin"
    password "password"
    role 1
  end
end 
