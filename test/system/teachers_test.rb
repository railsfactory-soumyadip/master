require "application_system_test_case"

class TeachersTest < ApplicationSystemTestCase
  setup do
    @teacher = teachers(:one)
  end

  test "visiting the index" do
    visit teachers_url
    assert_selector "h1", text: "Teachers"
  end

  test "creating a Teacher" do
    visit teachers_url
    click_on "New Teacher"

    fill_in "Contact", with: @teacher.contact
    fill_in "First name", with: @teacher.first_name
    fill_in "Last name", with: @teacher.last_name
    fill_in "Subject", with: @teacher.subject_id
    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit teachers_url
    click_on "Edit", match: :first

    fill_in "Contact", with: @teacher.contact
    fill_in "First name", with: @teacher.first_name
    fill_in "Last name", with: @teacher.last_name
    fill_in "Subject", with: @teacher.subject_id
    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
