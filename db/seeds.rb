require 'active_record'
require 'active_support'
require File.expand_path('../../lib/models/campaign', __FILE__)

puts 'Seeding database..'
Campaign.create!([
                  { job_id: 1, status: 0, external_reference: '1', ad_description: 'description 1' },
                  { job_id: 2, status: 1, external_reference: '2', ad_description: 'description 2' },
                  { job_id: 3, status: 2, external_reference: '3', ad_description: 'description 3' },
                  { job_id: 4, status: 0, external_reference: '4', ad_description: 'description 4' }
                ])

puts 'Seeding done!!'