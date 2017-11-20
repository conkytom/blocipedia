class Wiki < ApplicationRecord
  belongs_to :user

  validates :title, length: {minimum: 1 }, presence: true
  validates :body,  length: { minimum: 20}, presence: true
  validates :user,  presence: true
end
