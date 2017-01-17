class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :dessert
  has_many :votes

  validates :body, presence: true, length: { maximum: 200}
end
