require 'ruby2d'
require 'thread'

require_relative 'light_column'

class LightGrid
  def initialize(margin: 40, num_columns: 8, num_rows: 8)
    width  = Application.get :width
    height = Application.get :height
    
    spacing = (width - 2 * margin).to_f / (num_columns - 1)
    @num_rows = num_rows
    @columns =
      num_columns.times.map do |i|
        LightColumn.new x: margin + (i * spacing).round,
                   from: margin, to: (height - margin),
                   num_lights: num_rows
      end
    
    @semaphore = Mutex.new
    @colors = Array.new(num_rows * num_columns, 'random')
  end

  def update!
    @semaphore.synchronize do
      # Transfer the contents of @colors to the buffers
      @columns.each.with_index do |column, i_column|
        color_index = i_column * @columns.length + @num_rows
        column.each do |light|
          color_index -= 1
          light.color = @colors[color_index]
        end
      end
    end
  end
  
  # Write to the grid
  def write()
    @semaphore.synchronize do
      # Update @colors
    end
  end
end