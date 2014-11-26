class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date_start
      t.datetime :date_end
      t.text :body
      t.float :cost

      t.timestamps
    end
  end
end
