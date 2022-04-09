class Structure < ApplicationRecord
  belongs_to :user
  CATEGORIES = %w(bar bistrot troquet restaurant brasserie foodtruck)
  validates :name, :address, :cp, :district, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :user_id, uniqueness: true
end
