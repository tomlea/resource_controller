require File.dirname(__FILE__) + '/../test_helper'

class SecureControllerTest < ActionController::TestCase
  def setup
    @controller = SecureController.new
  end

  should "respond_to? :show" do
    assert_respond_to @controller, :show
  end

  should "have admin foo" do
    assert_respond_to @controller, :is_admin?
    assert @controller.is_admin?
  end
end
