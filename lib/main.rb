# frozen_string_literal: true

require 'active_record'

require_relative './models/campaign'
require_relative './../lib/save_discrepancies'

class Main

  def initialize
    ActiveRecord::Base.establish_connection(db_configuration["development"])
  end

  def show_discrepancies
    SaveDiscrepancies.call
  end

  def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
  end
end

main = Main.new
puts main.show_discrepancies
