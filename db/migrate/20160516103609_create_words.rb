class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :definition
      t.string :tags

      t.timestamps null: false
    end
  end
end
