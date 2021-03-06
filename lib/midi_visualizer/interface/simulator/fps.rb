module MIDIVisualizer
  module Interface
    class Simulator
      class Fps
        def initialize(x:, y:)
          @text = Text.new(x: x, y: y, text: text_from(0), size: 16,
                           font: "#{File.expand_path("../../../../../assets", __FILE__)}/Beon-Regular.otf")
          @fps = 0
          @semaphore = Mutex.new
        end

        def set(fps)
          @semaphore.synchronize { @fps = fps }
        end

        def update!
          fps_rounded = @semaphore.synchronize { @fps.round(1) }
          @text.text  = text_from(fps_rounded)
        end

        private

        def text_from(fps)
          "FPS: #{fps}"
        end
      end
    end
  end
end