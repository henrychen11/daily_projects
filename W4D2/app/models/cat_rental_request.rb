class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: ['APPROVED', 'DENIED', 'PENDING']

  belongs_to :cat,
  foreign_key: :cat_id,
  primary_key: :id,
  class_name: 'Cat'
# CatRentalRequest.new.overlapping_requests

  def overlapping_requests
    CatRentalRequest.where
    .not("start_date > :end_date OR end_date < :start_date", start_date: self.start_date, end_date: self.end_date)
    .where(cat_id: self.cat_id)
    .where.not(id: self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request?
    overlapping_approved_requests.empty?
  end

end
