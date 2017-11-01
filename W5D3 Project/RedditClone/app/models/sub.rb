class Sub < ApplicationRecord
  belongs_to :moderator,
  foreign_key: :moderator_id,
  class_name: 'User',
  inverse_of: :subs

  has_many :post_subs,
  inverse_of: :sub,
  dependent: :destroy

  has_many :posts,
  through: :post_subs,
  source: :post

end
