class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.boolean :done, null: false, default: false
      t.references :project, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
