require 'test_helper'

describe MIDIVisualizer::Interface::Simulator::Fps do
  subject { MIDIVisualizer::Interface::Simulator::Fps }
  let(:window) {
    MIDIVisualizer::Interface::Simulator::Application.get(:window) }
  let(:objects) { window.objects }
  let(:fps) { subject.new x: 5, y: 10 }
  let(:text_object) { objects.find { |o| Ruby2D::Text === o } }
  
  before { window.clear; fps }
  
  describe '.new' do
    it 'creates a new text object' do
      assert(text_object)
    end
    
    it 'initializes to 0 fps' do
      assert_equal 'FPS: 0', text_object.text
    end
  end
  
  describe '#set' do
    it 'sets the text after #update! is called' do
      fps.set(60.91)
      assert_equal 'FPS: 0', text_object.text
      fps.update!
      assert_equal 'FPS: 60.9', text_object.text
    end
  end
end