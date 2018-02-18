require 'color'
require 'test_helper'

interface = MIDIVisualizer::Interface::Simulator.new(6, 8)
colors    = Array.new(6*8) { ::Color::RGB.new rand, rand, rand, 1.0 }

interface.open do
  colors
end