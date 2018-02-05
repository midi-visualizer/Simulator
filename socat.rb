class Socat
  def initialize
    File.delete('socat.log') if File.file?('socat.log')

    @socat_thread =
      Thread.new do
        system 'socat -lf socat.log -d -d pty,raw,echo=0 pty,raw,echo=0'
      end
  end

  def devices
    loop do
      if File.file? 'socat.log'
        file = File.open('socat.log', "r")
        fileread = file.read

        unless fileread.count("\n") < 3
          ptys = fileread.scan(/PTY is (.*)/)
          return ptys[1][0], ptys[0][0]
        end
      end

      sleep 0.001
    end
  end
end