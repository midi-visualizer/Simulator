module MIDIVisualizer
  module Interface
    class Simulator
      class Light
        MASK_SIZE = 20

        def initialize(x:, y:, color:)
          offset = MASK_SIZE / 2
          x -= offset
          y -= offset

          assets_dir = File.expand_path("../../../../../assets", __FILE__)
          @mask  = Image.new  x: x, y: y, z: 1,
            path: "#{assets_dir}/light-mask.png"
          @light = Square.new x: x, y: y, size: MASK_SIZE, color: color
        end

        def color=(color)
          @light.color = color
        end
      end
    end
  end
end