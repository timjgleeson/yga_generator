class AddCalendarToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :calendar, index: true
  end
end
