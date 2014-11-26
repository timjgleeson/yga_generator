class Event < ActiveRecord::Base
  belongs_to :calender

  acts_as_list scope: :calendar
end
