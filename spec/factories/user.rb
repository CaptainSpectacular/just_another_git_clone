FactoryBot.define do
  factory :user do
    username ENV['TEST_USERNAME']
    uid ENV['TEST_UID']
    token ENV['TEST_TOKEN'] 
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end
end
