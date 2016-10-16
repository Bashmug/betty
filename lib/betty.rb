require 'io/console'

module Betty
  def self.interpret(command)
    if command.match(/^what can you do for me$/)
      topics = executors.flat_map(&:help)
                        .map {|executor| executor[:category] }
                        .sort

      return [
        {
          say: "I'm happy to help you with all your needs.\n " \
               "Tell me if you want to know more about a topic, for example by asking: " \
               "'Betty help me with <topic>' or 'Betty I need help with <topic>'.\n\n" \
               "These are the topics I can help you with:\n" \
               "#{tableize topics}"
        }
      ]
    end

    return []
  end

  def self.help
    [{
      category: 'Betty',
      description: '\033[34mTells you some things about me\033[0m',
      usage: [ 'what can you do for me' ]
    }]
  end

  def self.executors
    $executors
  end

  def self.tableize(words)
    available_width = IO.console.winsize.last
    longest_word = words.max_by {|word| word.size }
    column_size = longest_word.size + 1
    column_count = available_width / column_size

    rows = if column_count < 2
      words
    else
      words.each_slice(column_count).map do |words_in_row|
        words_in_row.map { |word| word.ljust(column_size) }.join
      end
    end

    rows.join("\n")
  end
end

$executors << Betty
