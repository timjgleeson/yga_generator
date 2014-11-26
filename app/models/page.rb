class Page < ActiveRecord::Base
  has_many :components
  acts_as_list

  default_scope { order(:position) }
  scope :published, lambda { where(is_published: true) }
end
