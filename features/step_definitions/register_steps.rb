Given(/^user inputs a valid email and password$/) do
  @tests.test_registration.sign_in
end

Then(/^user is signed in and can choose theme$/) do
  @tests.test_registration.validate_signed_in
end
