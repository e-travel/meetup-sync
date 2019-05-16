require 'spec_helper'
require_relative '../../handlers/sync'

module MeetupSync
  describe Sync do
    let(:event) { nil }

    subject { MeetupSync::Sync.handler(event: event, context: nil) }
    let(:events) {
        {
          :events => [
            {
              :created => 1545927804000,
              :duration => 43200000,
              :id => "257560627",
              :name => "WeTest.Athens",
              :date_in_series_pattern => false,
              :status => "upcoming",
              :time => 1558069200000,
              :local_date => "2019-05-17",
              :local_time => "08:00",
              :updated => 1550765758000,
              :utc_offset => 10800000,
              :waitlist_count => 0,
              :yes_rsvp_count => 49,
              :venue => {
                :id => 25481453,
                :name => "Kastorias 34-36, Votanikos, Athens",
                :lat => 37.98331069946289,
                :lon => 23.710830688476562,
                :repinned => true,
                :address_1 => "ATHINAIS Cultural Center",
                :city => "10447",
                :country => "gr",
                :localized_country_name => "Greece"
              },
              :group => {
                :created => 1537883465000,
                :name => "WeTest.Athens",
                :id => 29955477,
                :join_mode => "open",
                :lat => 37.97999954223633,
                :lon => 23.729999542236328,
                :urlname => "WeTest-Athens",
                :who => "Members",
                :localized_location => "Athens, Greece",
                :state => "",
                :country => "gr",
                :region => "en_US",
                :timezone => "Europe/Athens"
              },
              :link => "https://www.meetup.com/WeTest-Athens/events/257560627/",
              :description => "<p>WeTest.Athens is the first Software Testing Conference happening in Greece.</p> <p>Our mission is to share knowledge , tech and best practices and create a strong community of Software Test Engineers.</p> <p>Join an one day event full of talks , workshops and parallel events with international and local presenters.</p> <p>Tickets on sale : <a href=\"https://www.eventora.com/en/Events/wetest_athens_software_testing_conf\" class=\"linkified\">https://www.eventora.com/en/Events/wetest_athens_software_testing_conf</a></p> <p><a href=\"http://wetest-athens.gr/\" class=\"linkified\">http://wetest-athens.gr/</a></p> ",
              :visibility => "public",
              :pro_is_email_shared => false
            }
          ]
        }
    }

    before do
      stub_request(:get, /api.meetup.com/).
      to_return(status: 200, body: events.to_json, headers: {})
    end

    describe '#handler' do
      it 'responds successfully' do
        expect(subject[:statusCode]).to eq(200)
      end
    end
  end
end
