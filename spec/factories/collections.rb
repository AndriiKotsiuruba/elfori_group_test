# == Schema Information
#
# Table name: collections
#
#  id          :bigint           not null, primary key
#  description :text
#  publish     :boolean
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :collection do
    title                 { Faker::Commerce.department }
    publish               { true }
    description           { Faker::Food.description }
  end
end
