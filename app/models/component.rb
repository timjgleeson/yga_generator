class Component < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :page
  self.inheritance_column = nil
  acts_as_list scope: :page

  default_scope { order(:position) }
end
