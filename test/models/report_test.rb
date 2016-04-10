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

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
