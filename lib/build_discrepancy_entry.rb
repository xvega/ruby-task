# frozen_string_literal: true

require_relative '../lib/callable'
require_relative '../lib/models/campaign'

class BuildDiscrepancyEntry

  include Callable

  attr_reader :local_campaign, :remote_campaign

  def initialize(remote_campaign)
    @local_campaign = Campaign.find_reference(remote_campaign&.dig('reference'))
    @remote_campaign = remote_campaign
  end

  def call
    build_entry_template if !local_campaign.nil? && !remote_campaign.nil?
  end

  def build_entry_template
    {
      "remote_reference": remote_campaign['reference'],
      "discrepancies": build_discrepancy_entry
    }
  end

  def build_discrepancy_entry
    discrepancies = []
    local_remote_hash = { status: 'status', ad_description: 'description' }
    local_remote_hash.each_pair do |key, value|
      discrepancies << detect_discrepancies(local_campaign[key], remote_campaign[value])
    end
    discrepancies
  end

  def detect_discrepancies(local, remote)
    return if local == remote

    {
      "remote": remote,
      "local": local
    }
  end
end
