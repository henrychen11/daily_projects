class ShortenedUrl < ApplicationRecord


  def self.random_code
    short = nil
    until short
      short = SecureRandom::urlsafe_base64
      if ShortenedUrl.exists?(short_url: short)
        short = nil
      else
        return short
      end
    end
  end

  def self.create_url(long_url, user_id)
    short_url = ShortenedUrl.random_code
    url = ShortenedUrl.new(short_url: short_url, long_url: long_url, user_id: user_id)
    url.save!
    url
  end

  def self.search(short_url)
    ShortenedUrl.find_by(short_url: short_url)
  end

  belongs_to(
  :submitter,
  class_name: 'User',
  primary_key: :id, # @Users table
  foreign_key: :user_id #
  )

  has_many(
    :visits,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :shortened_urls_id
  )

  has_many :visitors, through: :visits, source: :user

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visits.select(:user_id).distinct.count
    # id_arr = []
    #
    # self.visits.each do |visit|
    #   id_arr << visit.user_id
    # end
    # id_arr.uniq.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).distinct.where(10.minutes.ago)
  end

end
