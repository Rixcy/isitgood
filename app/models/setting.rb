class Setting < ActiveRecord::Base
  validates :name, :nice_name, :value, presence: true
  validates :nice_name, uniqueness: true, on: :create
end
