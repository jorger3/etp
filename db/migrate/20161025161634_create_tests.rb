class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :email
      t.datetime :fecha

      t.timestamps
    end
  end
end
