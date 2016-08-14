require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do                                 #This is an example of a functiona test
    get :index                                               #This kind of test verify if that the model, view and controller work well
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
