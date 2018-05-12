class RegistrationScreen
  def initialize
    @start_sign_in_button = Elements.new(:id, "Sign In")
    @email_field = Elements.new(:id, 'i0116')
    @next_button = Elements.new(:id, 'idSIButton9')
    @password_field = Elements.new(:id, 'i0118')
    @finish_sign_in_button = Elements.new(:id, 'idSIButton9')
    @choose_theme_view = Elements.new(:id, 'Choose Your Theme')
  end

  def sign_in(email, password)
    @start_sign_in_button.click
    fill_email(email)
    fill_password(password)
  end

  def fill_email(email)
    @email_field.set(email)
    @next_button.click
  end

  def fill_password(password)
    @password_field.set(password)
    @finish_sign_in_button.click
  end

  def validate_signed_in
    @choose_theme_view.wait_to_be_visible
  end
end
