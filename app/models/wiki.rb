class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, length: {minimum: 1 }, presence: true
  validates :body,  length: { minimum: 20}, presence: true
  #validates :user,  presence: true

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) do
      return all if user_see_private?
      where(private: [false, nil])
  end
end
