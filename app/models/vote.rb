class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true, uniqueness: { scope: :review }
  validates :review, presence: true, uniqueness: { scope: :user }
end
