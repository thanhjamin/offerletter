require 'test_helper'

feature "admin exams for offerletter" do
  scenario "admin tries to create a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # admin must sign in properly
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    click_on 'Create Exam'

    # inputs exams info
    fill_in 'exam_name', with: 'This is an example exam'
    fill_in 'exam_questions_attributes_0_content', with: 'This is a sample question'
    fill_in 'exam_questions_attributes_0_answers_attributes_1_content', with: 'This is a sample answer'

    # click on create exam
    click_on 'Submit'

    # Success message
    page.text.must_include 'Exam was successfully created'

  end

  scenario "admin tries to edit a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on edit exam
    click_on 'Edit'

    # inputs exams info
    fill_in 'exam_name', with: 'Changing This Exam'

    # click on create exam
    click_on 'Submit'

    # Success message
    page.text.must_include 'Exam was successfully updated'
    page.text.must_include 'Changing This Exam'
    page.text.wont_include 'Example Test'

  end

  scenario "admin tries to delete a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on destroy exam
    click_on 'Destroy'

    # Success message
    page.text.wont_include 'Example Test'

  end

  scenario "admin tries to take a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on edit exam
    click_on 'Take Exam'

    # Exam must show content
    page.text.must_include 'Which of the following is a mammal?'

    # Select an answer
    choose('answer_3')

    # click on next question
    click_on 'Next Question'

    # Exam page must show score
    page.text.must_include '100'

  end
end
