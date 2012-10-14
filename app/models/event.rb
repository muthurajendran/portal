class Event < ActiveRecord::Base
  has_and_belongs_to_many :guests
  has_and_belongs_to_many :volunteers
  validates_presence_of :event_name, :message=>"can't be blank"
end
