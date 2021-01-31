class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true, index: true
      t.string :name

      t.timestamps
    end
  end
end
