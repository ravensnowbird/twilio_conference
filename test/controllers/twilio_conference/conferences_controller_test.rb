require 'test_helper'

module TwilioConference
  class ConferencesControllerTest < ActionController::TestCase
    test "should get create" do
      get :create
      assert_response :success
    end

  end
end
