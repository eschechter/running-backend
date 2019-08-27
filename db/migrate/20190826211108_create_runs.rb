class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.boolean :finalized
      t.boolean :completed
      t.point :coordinates, array: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
