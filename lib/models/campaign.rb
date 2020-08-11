# frozen_string_literal: true

require 'active_record'

class Campaign < ActiveRecord::Base
  enum status: { active: 0, paused: 1, deleted: 2 }

  def self.find_reference(reference)
    where(external_reference: reference).first
  end
end
