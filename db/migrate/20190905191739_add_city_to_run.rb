class AddCityToRun < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :city, :string
  end
end
