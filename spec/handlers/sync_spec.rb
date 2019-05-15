require 'spec_helper'
require_relative '../../handlers/sync'

module MeetupSync
  describe Sync do
    let(:event) { nil }

    subject { MeetupSync::Sync.handler(event: event, context: nil) }

    describe '#handler' do
      it 'responds successfully' do
        expect(subject[:statusCode]).to eq(200)
      end
    end
  end
end
