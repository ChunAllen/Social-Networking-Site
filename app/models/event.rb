class Event < ActiveRecord::Base
  attr_accessible :details, :event_name, :time, :user_id, :when, :where
end
