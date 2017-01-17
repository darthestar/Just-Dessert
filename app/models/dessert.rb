class Dessert < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30}
  validates :description, presence: true

end
