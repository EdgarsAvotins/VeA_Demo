Given(/^user inputs a valid email and password$/) do
  start_sign_in_button = Elements.new(:id, "Sign In")
  start_sign_in_button.click

  email_field = Elements.new(:id, 'i0116')
  email_field.set('vea_demo_user@inbox.lv')

  next_button = Elements.new(:id, 'idSIButton9')
  next_button.click

  password_field = Elements.new(:id, 'i0118')
  password_field.set('Parole123')

  finish_sign_in_button = Elements.new(:id, 'idSIButton9')
  finish_sign_in_button.click
end

Then(/^user is signed in and can choose theme$/) do
  choose_theme_view = Elements.new(:id, 'Choose Your Theme')
  choose_theme_view.wait_to_be_visible
end
