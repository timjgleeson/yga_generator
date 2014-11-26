class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :title
      t.string :type
      t.references :calendar, index: true
      t.references :page, index: true

      t.timestamps
    end
  end
end
