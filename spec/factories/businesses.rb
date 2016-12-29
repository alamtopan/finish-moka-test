FactoryGirl.define do
  factory :business do |f|
    f.name { 'Alam' }
    f.address { 'Lembursitu' }
    f.city { 'Sukabumi' }
    f.user_id {User.last}
  end
end