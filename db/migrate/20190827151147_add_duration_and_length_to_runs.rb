class AddDurationAndLengthToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :duration, :integer
    add_column :runs, :length, :float
  end
end
