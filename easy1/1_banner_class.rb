# make the test cases work as intended.
# do not make the implementation details public

class Banner
  def initialize(message, total_width=(message.size + 4))
    self.message = message
    self.width = total_width - 4
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_accessor :message, :width

  def horizontal_rule
    '+-' + ('-' * width) + '-+'
  end

  def empty_line
    '| ' + (' ' * width) + ' |'
  end

  def message_line
    if width >= message.length
      "| #{message.center(width)} |"
    else
      "| #{message.slice(0...width)} |"
    end
  end
end

banner = Banner.new('To boldy go where no one has gone before.', 80)
puts banner

puts "\n\n"

banner = Banner.new('')
puts banner
