class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.integer :page_visits
      t.datetime :last_visit
      t.boolean :mobile

      t.timestamps
    end
  end
end
