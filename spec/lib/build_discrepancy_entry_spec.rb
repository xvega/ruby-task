require File.expand_path('../../../lib/build_discrepancy_entry', __FILE__)
require File.expand_path('../../../lib/models/campaign', __FILE__)
require File.expand_path('../../../spec/spec_helper', __FILE__)

RSpec.describe BuildDiscrepancyEntry do

  subject(:test_class) { described_class }

  describe '#build_discrepancy_entry' do
    let(:external_campaign) { { "ads": [ { 'reference' => '1', 'status' => 'enabled', 'description' => 'Description for campaign 11' }, { 'reference' => '2', 'status' => 'disabled', 'description' => 'Description for campaign 12' }, { 'reference' => '3', 'status' => 'enabled', 'description' => 'Description for campaign 13' } ] } }
    let(:discrepancy_entry) { {:discrepancies=>[{:local=>'active', :remote=>'enabled'}, {:local=>'Describing the add in a creative way', :remote=>'Description for campaign 11'}], :remote_reference=>'1'} }

    context 'for one single discrepancy entry' do
      let!(:campaign) { FactoryBot.create(:campaign) }

      context 'when a local campaign exists' do

        it 'returns a discrepancy' do
          campaign
          external_campaign_entry = external_campaign[:ads].first
          expect(test_class.call(external_campaign_entry)).to eq(discrepancy_entry)
        end
      end

      context 'when a local campaign does not exist' do
        it 'does not save an empty record' do
          expect(test_class.call(nil)).to eq(nil)
        end
      end
    end
  end
end
