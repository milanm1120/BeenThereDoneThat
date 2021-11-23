class CreatePins < ActiveRecord::Migration[6.1]
  def change
    create_table :pins do |t|
      t.integer :rating
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
