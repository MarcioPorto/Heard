class Report < ActiveRecord::Base
  belongs_to :category
  has_many :answers, :dependent => :destroy

  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, :if => :longitude_changed? or :latitude_changed?

  def block?
    if self.block_votes == 3
      return true
    else
      return false
    end
  end
end
