require File.expand_path('../../../lib/retrieve_remote_campaigns', __FILE__)
require File.expand_path('../../../spec/spec_helper', __FILE__)

RSpec.describe RetrieveRemoteCampaigns do

  subject(:test_class) { described_class }

  describe '#external_campaigns_request' do
    let(:campaign_url) { "https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df" }
    let(:campaign_response) { instance_double(HTTParty::Response, body: campaign_response_body) }
    let(:campaign_response_body) { 'response_body' }

    before do
      allow(HTTParty).to receive(:get).and_return(campaign_response)
      allow(JSON).to receive(:parse)

      test_class.call
    end

    it 'fetches the campaigns from the external API' do
      expect(HTTParty).to have_received(:get).with(campaign_url)
    end

    it 'parses the API response' do
      expect(JSON).to have_received(:parse).with(campaign_response_body)
    end
  end
end
