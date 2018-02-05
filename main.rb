require 'ruby2d'
require 'serialport'
require 'thread'

require_relative 'light_grid'
require_relative 'socat'
require_relative 'fps'

SERIAL_BAUD = 115200

ROWS    = 8
COLUMNS = 8

set title: "MIDI Vizualizer"

grid = LightGrid.new num_rows: ROWS, num_columns: COLUMNS

socat = Socat.new
dev_1, dev_2 = socat.devices

puts "Please connect to #{dev_1}"

last_update = Time.now.to_f
fps = Fps.new x: 5, y: 5

serial_thread =
  Thread.new do
    port = SerialPort.new dev_2, SERIAL_BAUD, 8, 1, SerialPort::NONE
    port.read_timeout = 50
    
    loop do
      d = port.read(256)
      grid.write if d
      this_update = Time.now.to_f
      
      fps.set 1.0 / (this_update - last_update)

      last_update = this_update
    end
  ensure
    port.close
  end
  
update do
  fps.update!
  grid.update!
end

show
serial_thread.kill