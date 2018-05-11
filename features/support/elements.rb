class Elements
  def initialize(type, value)
    @type = type
    @value = value
  end

  def wait_to_be_visible(default_wait_time: 60)
    exception = ""
    start = Time.now
    while (Time.now - start) < default_wait_time
      begin
        el = $driver.find_element(@type, @value)
        return el
      rescue => e
        exception = e
        p "again, #{@value}"
        sleep(0.1)
      end
    end
    raise "Element #{@value} is not visible after #{default_wait_time} seconds \n Exception: #{exception}"
  end

  def click
    element = wait_to_be_visible
    element.click
  end

  def set(text)
    element = wait_to_be_visible
    element.send_keys(text)
    hide_keyboard
  end

  def hide_keyboard
    begin
      $driver.hide_keyboard
    rescue
      p 'Keyboard was not open'
    end
  end
end
