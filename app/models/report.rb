# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  address     :string
#  latitude    :float
#  longitude   :float
#  called_911  :boolean          default(FALSE)
#  description :string
#  ip_address  :string           default("")
#  blocked     :boolean          default(FALSE)
#  block_votes :integer          default(0)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
