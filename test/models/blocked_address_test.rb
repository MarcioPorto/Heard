# == Schema Information
#
# Table name: blocked_addresses
#
#  id         :integer          not null, primary key
#  ip_address :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BlockedAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
