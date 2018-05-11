# Then(/^I register$/) do
#   elements = $driver.find_elements(:xpath, '//*')
#   elements.each do |el|
#     p el.text
#   end
#   sleep(5)
#   elements = $driver.find_elements(:xpath, '//*')
#   elements.each do |el|
#     p el.text
#   end
#   el = $driver.find_element(:id, 'Create Account')
#   el.click
#   p Time.now
#   smth = Time.now
#   sleep(5)
#   p Time.now
#   p Time.now - smth
#   $driver.find_element(:id, 'asnkdj naskjdn kajsn ')
# end

Given(/^user inputs a valid email and password$/) do
  # Sign In
  # i0116 (email field)
  # idSIButton9 (next)
  # i0118 (password field)
  # idSIButton9 (sign in)
  # //*[@text='Skip']
end

Then(/^user has signed in successfully$/) do
  # smth
end
