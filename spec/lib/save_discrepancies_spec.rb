require File.expand_path('../../../lib/save_discrepancies', __FILE__)
require File.expand_path('../../../lib/models/campaign', __FILE__)
require File.expand_path('../../../lib/models/discrepancy_log', __FILE__)
require File.expand_path('../../../lib/build_discrepancy_entry', __FILE__)
require File.expand_path('../../../spec/spec_helper', __FILE__)

RSpec.describe SaveDiscrepancies do

  subject(:test_class) { described_class }

  describe '#save_discrepancies' do
    let(:discrepancy_log) { FactoryBot.create(:discrepancy_log) }
    let(:external_campaign) { { "ads": [ { "reference" => "1", "status" => "enabled", "description" => "Description for campaign 11" }, { "reference" => "2", "status" => "disabled", "description" => "Description for campaign 12" }, { "reference" => "3", "status" => "enabled", "description" => "Description for campaign 13" } ] } }
    let(:discrepancies) { [{'remote_reference' => "1", 'discrepancies' => [{remote: "enabled", local: "active"}, {remote: "Description for campaign 11", local: "Describing the add in a creative way"}]}].to_s }

    context 'when there is a discrepancy' do
      let!(:campaign) { FactoryBot.create(:campaign) }

      it 'saves the record' do
        expect { test_class.call }.to change { DiscrepancyLog.count }.by(1)
      end
    end

    context 'when there is no discrepancy' do
      it 'does not save an empty record' do
        expect(DiscrepancyLog.last).to_not eq([])
        expect { test_class.call }.to change { DiscrepancyLog.count }.by(0)
      end
    end
  end
end
