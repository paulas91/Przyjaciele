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
  let(:message1) { 'Hello World' }
  let(:message2) { 'Ruby is awesome' }

  it 'logs a message' do
    logged_message = logger.log(message1)
    expect(logged_message).to include 'Hello World'
  end

  context 'for logging' do
    let(:message1) { 'Other message'}

    it 'adds message to messages array' do
      logger.log(message1)
      logger.log(message2)
      expect(logger.messages).to include message1
      expect(logger.messages).to include message2
    end
  end
end
