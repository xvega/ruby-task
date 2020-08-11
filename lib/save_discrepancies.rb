# frozen_string_literal: true

require_relative '../lib/callable'
require_relative '../lib/models/discrepancy_log'
require_relative '../lib/models/campaign'
require_relative '../lib/retrieve_remote_campaigns'
require_relative '../lib/build_discrepancy_entry'

class SaveDiscrepancies
  include Callable

  attr_reader :remote_campaigns

  def initialize
    @remote_campaigns = RetrieveRemoteCampaigns.call
  end

  def call
    save_discrepancies if remote_campaigns
  end

  def save_discrepancies
    discrepancies = []
    remote_campaigns['ads'].each_with_object({}) do |remote_campaign, _|
      discrepancy_entry = BuildDiscrepancyEntry.call(remote_campaign)
      discrepancies << discrepancy_entry unless discrepancy_entry.nil?
    end
    unless discrepancies.empty?
      DiscrepancyLog.create(discrepancies: discrepancies.to_s)
    end
    discrepancies
  end
end
