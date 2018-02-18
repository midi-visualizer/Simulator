require 'thread'
require 'midi_visualizer/interface/simulator/ruby2d'
require 'midi_visualizer/interface/simulator/light'
require 'midi_visualizer/interface/simulator/light_column'
require 'midi_visualizer/interface/simulator/light_grid'
require 'midi_visualizer/interface/simulator/fps'

module MIDIVisualizer
  module Interface
    class Simulator
      attr_reader :rows, :columns
            
      def initialize(rows = 6, columns = 8)
        @rows    = rows
        @columns = columns
        
        @grid        = LightGrid.new num_rows: rows, num_columns: columns
        @last_update = Time.now.to_f
        @fps         = Fps.new x: 5, y: 5
        
        Application.set title: "MIDI Visualizer"
      end
      
      def open
        Application.update do
          colors = yield if block_given?
          
          @grid.write(colors)
          
          this_update = Time.now.to_f
          @fps.set 1.0 / (this_update - @last_update)
          @last_update = this_update
          
          @fps.update!
          @grid.update!
        end
        
        Application.show
      end
    end
  end
end
