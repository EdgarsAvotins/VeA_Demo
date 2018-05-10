class Server
  def initialize(options)
    @port = options['port']
    @port_boot = options['portboot']
    @sn = options['sn']
    @apk = options['app']
    @app_package = options['appPackage']
  end

  def start
    stop
    p @port, @port_boot, @sn, @app_package, @apk
    `appium -p #{@port} -bp #{@port_boot} -U #{@sn} >> ./logs_#{@sn}.log 2>&1 &`
  end

  def stop
    lines = `ps ax | grep #{@sn} | grep node`.split("\n")
    lines.each do |line|
      pid = line.split(' ').first
      `kill -9 #{pid}`
    end
  end

  def reinstall_app
    delete_app
    error = nil
    start = Time.now
    while (Time.now - start) < 60
      begin
        install_app
        return
      rescue => e
        error = e
      end
    end
    raise "Could not install the app!\n#{error}"
  end

  def delete_app
    begin
      p 'Deleting app'
      result = `adb -s #{@sn} uninstall #{@app_package}`
      p result[0..100]
    rescue => e
      p 'Nothing to delete'
      p @sn, e
    end
  end

  def install_app
    p 'Installing the app'
    result = `adb -s #{@sn} install -r -d #{@apk}`
    p result[0..100]
  end

  def wait_to_boot
    opened = false
    p `nmap -p #{@port} localhost | grep #{@port}`
    until opened do
      p `nmap -p #{@port} localhost | grep #{@port}`
      opened = `nmap -p #{@port} localhost | grep #{@port}`.include?('open')
      p opened
      sleep(0.1)
    end
  end
end
