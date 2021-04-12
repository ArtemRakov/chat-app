# frozen_string_literal: true

require 'test_helper'

class Web::TeamsControllerTest < ActionDispatch::IntegrationTest
  test 'index' do
    get teams_path
    assert_response :success
  end

  test 'show' do
    team = teams(:one)

    get team_path(team.slug)
    assert_response :redirect
  end
end
