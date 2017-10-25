class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: ["Yellow", "Brown", "Grey"]
  validates :sex, inclusion: ["M", "F"]

  def age
    @age = Date.today.year - birth_date.year
  end

  has_many :rental_request,
  foreign_key: :cat_id,
  primary_key: :id,
  class_name: 'CatRentalRequest',
  dependent: :destroy

end
