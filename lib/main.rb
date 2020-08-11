# frozen_string_literal: true

require 'active_record'

class Main

  def initialize
    ActiveRecord::Base.establish_connection(db_configuration["development"])
  end

  def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
  end
end

main = Main.new
main
