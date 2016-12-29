class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  scope :latest, ->{order(created_at: :desc)}
  scope :oldest, ->{order(created_at: :asc)}

  validates :name,  presence: true
  validates :address,  presence: true
  validates :city, presence: true
  validates :user_id, presence: true
end
