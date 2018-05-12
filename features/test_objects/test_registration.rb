class TestRegistration
  def initialize(screens)
    @screens = screens
    
    # these hardcoded string should be taken from data objects,
    # but will stay here for easier understanding
    @email = 'vea_demo_user@inbox.lv'
    @password = 'Parole123'
  end

  def sign_in
    @screens.registration.sign_in(@email, @password)
  end

  def validate_signed_in
    @screens.registration.validate_signed_in
  end
end
