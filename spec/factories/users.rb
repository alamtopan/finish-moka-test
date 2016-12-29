FactoryGirl.define do
  factory :user do |f|
    f.email { 'alam@gmail.com' }
    f.password { '12345678' }
    f.password_confirmation { '12345678' }
    f.first_name { 'Alam' }
    f.last_name { 'Topani' }
  end
end