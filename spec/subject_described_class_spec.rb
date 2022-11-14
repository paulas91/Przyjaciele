class MyLogger
  attr_reader :messages

  def initialize
    @messages = []
  end

  def log(message)
    @messages << message
    message
  end

end

describe MyLogger do
  subject(:logger) { described_class.new }

  it 'logs a message' do
    logged_message = logger.log('Hello World')
    expect(logged_message).to include 'Hello World'
  end

  it 'adds message to messages array' do
    message1 = 'Hello World'
    message2 = 'Ruby is awesome'
    logger.log(message1)
    logger.log(message2)
    expect(logger.messages).to include message1
    expect(logger.messages).to include message2
  end
end
