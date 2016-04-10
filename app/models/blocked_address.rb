# == Schema Information
#
# Table name: blocked_addresses
#
#  id         :integer          not null, primary key
#  ip_address :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlockedAddress < ActiveRecord::Base
end
