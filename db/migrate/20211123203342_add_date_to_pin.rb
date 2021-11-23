class AddDateToPin < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :date, :date
  end
end
