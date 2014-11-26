class AddBodyToComponent < ActiveRecord::Migration
  def change
    add_column :components, :body, :text
  end
end
