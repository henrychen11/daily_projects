class Post < ApplicationRecord
  validates :title, :user_id, presence: false

  belongs_to :author,
  foreign_key: :user_id,
  class_name: 'User',
  inverse_of: :posts

  has_many :post_subs,
  inverse_of: :subs,
  dependent: :destroy

  has_many :subs,
  through: :post_subs,
  source: :sub

end
