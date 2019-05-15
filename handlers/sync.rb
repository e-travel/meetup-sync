require 'json'

require_relative '../lib/log'

module MeetupSync
  class Sync
    def self.handler(event:, context:)
      Log.info("Function #{self.name} executed successfully!")

      { statusCode: 200, body: JSON.generate("Function #{self.name} executed successfully!") }
    end
  end
end
