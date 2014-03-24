class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.text :referer
      t.string :session
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
