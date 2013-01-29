require 'test_helper'

class MailboxesControllerTest < ActionController::TestCase
  setup do
    @mailbox = mailboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailbox" do
    assert_difference('Mailbox.count') do
      post :create, mailbox: { qrcode: @mailbox.qrcode, user_id: @mailbox.user_id }
    end

    assert_redirected_to mailbox_path(assigns(:mailbox))
  end

  test "should show mailbox" do
    get :show, id: @mailbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailbox
    assert_response :success
  end

  test "should update mailbox" do
    put :update, id: @mailbox, mailbox: { qrcode: @mailbox.qrcode, user_id: @mailbox.user_id }
    assert_redirected_to mailbox_path(assigns(:mailbox))
  end

  test "should destroy mailbox" do
    assert_difference('Mailbox.count', -1) do
      delete :destroy, id: @mailbox
    end

    assert_redirected_to mailboxes_path
  end
end
