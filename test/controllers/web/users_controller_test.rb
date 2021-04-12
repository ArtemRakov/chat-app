# frozen_string_literal: true

require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'new' do
    get new_user_path
    assert_response :success
  end

  test 'create' do
    user_params = FactoryBot.attributes_for(:user)
    post users_url, params: { user_sign_up_form: user_params }
    assert_response :redirect

    user = User.find_by email: user_params[:email].downcase

    assert { user }
    assert { signed_in? }
  end
end
