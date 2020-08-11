FactoryBot.define do
  factory :campaign do
    job_id { '1' }
    status { 0 }
    external_reference { '1' }
    ad_description { 'Describing the add in a creative way' }
  end
end
