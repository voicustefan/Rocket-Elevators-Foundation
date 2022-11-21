require "application_system_test_case"

class SendSmsTest < ApplicationSystemTestCase
  setup do
    @send_sm = send_sms(:one)
  end

  test "visiting the index" do
    visit send_sms_url
    assert_selector "h1", text: "Send Sms"
  end

  test "creating a Send sm" do
    visit send_sms_url
    click_on "New Send Sm"

    click_on "Create Send sm"

    assert_text "Send sm was successfully created"
    click_on "Back"
  end

  test "updating a Send sm" do
    visit send_sms_url
    click_on "Edit", match: :first

    click_on "Update Send sm"

    assert_text "Send sm was successfully updated"
    click_on "Back"
  end

  test "destroying a Send sm" do
    visit send_sms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send sm was successfully destroyed"
  end
end
