# frozen_string_literal: true

require 'test_helper'

class Web::Account::TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in_as(:one)
  end

  test 'index' do
    get account_teams_path
    assert_response :success
  end

  test 'new' do
    get new_account_team_path
    assert_response :success
  end

  test 'create' do
    team_params = FactoryBot.attributes_for(:team)
    post account_teams_path, params: { team: team_params }
    assert_response :redirect

    team = Team.find_by(slug: team_params[:slug])

    assert { team }
  end
end
