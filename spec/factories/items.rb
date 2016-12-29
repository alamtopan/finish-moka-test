FactoryGirl.define do
  factory :item do |f|
    f.name { 'Item Property' }
    f.price { 10000 }
    f.business_id {Business.last.id}
  end
end