class CreateBank < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :descripration

      t.timestamps
    end
  end
end
