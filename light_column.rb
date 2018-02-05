require 'ruby2d'

require_relative 'light'

class LightColumn
  def initialize(x:, from:, to:, num_lights: 11, color: 'random')
    spacing = num_lights == 1 ? 0 : (to - from).to_f / (num_lights - 1)
    @lights =
      num_lights.times.map do |i|
        y = from + (i * spacing).round
        Light.new x: x, y: y, color: color
      end
  end

  def each(&block)
    @lights.each &block
  end
end