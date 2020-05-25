class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.datetime :finished_at, null: true, default: nil
      t.references :project, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
