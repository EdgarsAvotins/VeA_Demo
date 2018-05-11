require 'rspec/expectations'
require 'appium_lib'
require 'cucumber'
require 'json'
require 'base64'
require 'yaml'
require_relative 'server'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

options = {
  'port' => 5478,
  'portboot' => 5578,
  'sn' => '98867841334d475732',
  'app' => '~/Downloads/skype_13.apk',
  'appPackage' => 'com.skype.raider'
}

desired_capabilities = {
  'deviceName' => options['sn'],
  "platformVersion" => '7.0',
  'platformName' => 'Android',
  'appActivity' => 'com.skype4life.MainActivity',
  'appPackage' => options['appPackage'],
  'noReset' => 'False'
}

server = Server.new(options)
server.reinstall_app
server.start
server.wait_to_boot

p desired_capabilities
$driver = Appium::Driver.new(caps: desired_capabilities, appium_lib: { server_url: "http://localhost:#{options['port']}/wd/hub" })

World do
  AppiumWorld.new
end

Before do
  $driver.start_driver
  $driver.set_wait(0.1)
  p 'driver started'
end

After do |scenario|
  begin
    if scenario.failed?
      add_screenshot(scenario.name)
    end
  rescue => e
    p 'Failed to add screenshot'
    p e
  end
  $driver.driver_quit
end

def add_screenshot(scenario_name)
  scenario_name.tr!(" ", "_")
  local_name = "reports/#{scenario_name}.png"
  $driver.screenshot(local_name)
  embed(local_name, 'image/png', "SCREENSHOT")
end

at_exit do
  server.stop
end
