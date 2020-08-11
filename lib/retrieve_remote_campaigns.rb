# frozen_string_literal: true

require_relative '../lib/callable'
require 'httparty'

class RetrieveRemoteCampaigns
  include Callable

  URI = 'https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df'

  def call
    external_campaigns_request
  end

  def external_campaigns_request
    response = HTTParty.get(URI)
    JSON.parse(response.body)
  end
end
