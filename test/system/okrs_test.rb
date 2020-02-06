require "application_system_test_case"

class OkrsTest < ApplicationSystemTestCase
  setup do
    @okr = okrs(:one)
  end

  test "visiting the index" do
    visit okrs_url
    assert_selector "h1", text: "Okrs"
  end

  test "creating a Okr" do
    visit okrs_url
    click_on "New Okr"

    fill_in "Milestone", with: @okr.milestone
    fill_in "Objective", with: @okr.objective
    fill_in "Owner", with: @okr.owner
    fill_in "Project", with: @okr.project
    click_on "Create Okr"

    assert_text "Okr was successfully created"
    click_on "Back"
  end

  test "updating a Okr" do
    visit okrs_url
    click_on "Edit", match: :first

    fill_in "Milestone", with: @okr.milestone
    fill_in "Objective", with: @okr.objective
    fill_in "Owner", with: @okr.owner
    fill_in "Project", with: @okr.project
    click_on "Update Okr"

    assert_text "Okr was successfully updated"
    click_on "Back"
  end

  test "destroying a Okr" do
    visit okrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Okr was successfully destroyed"
  end
end
