class Item < ActiveRecord::Base
  belongs_to :business

  default_scope {order(created_at: :desc)}
  scope :oldest, ->{order(created_at: :asc)}

  validates :name,  presence: true
  validates :price,  presence: true
  validates :business_id, presence: true
end
