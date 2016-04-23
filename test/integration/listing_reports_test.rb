require 'test_helper'

# This test simulates a user interaction with our API
class ListingReportsTest < ActionDispatch::IntegrationTest
  # Uses the API url set in the hosts file
  setup { host! 'api.rails-dev.com' }

  test 'returns reports filtered by whether they are blocked' do
    # Use FactoryGirl later
    report_1 = Report.create!(
      latitude: 50.0,
      longitude: 50.0,
      called_911: false,
      description: 'Report #1',
      blocked: false,
      block_votes: 0
    )
    report_2 = Report.create!(
      latitude: 50.0,
      longitude: 50.0,
      called_911: false,
      description: 'Report #1',
      blocked: true,
      block_votes: 3
    )

    get '/reports.json'
    assert_equal 200, response.status # assert response.success?

    reports = JSON.parse(response.body, symbolize_names: true)
    descriptions = reports.collect { |r| r[:description] }
    assert_includes descriptions, 'Report #1'
    refute_includes descriptions, 'Report #2'

    # TODO: Fix error with JBuilder
  end

  test 'returns report by id' do
    report = Report.create!(
      latitude: 50.0,
      longitude: 50.0,
      called_911: false,
      description: 'Report #1',
      blocked: false,
      block_votes: 0
    )

    get "/reports/#{report.id}"
    assert_equal 200, response.status

    report_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal report.description, report_response[:description]
  end
end
