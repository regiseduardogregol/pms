class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.string :port
      t.string :user
      t.string :password
      t.boolean :sysadm
      t.string :root_password
      t.references :device
      t.references :category
      t.references :service

      t.timestamps
    end
    add_index :servers, :device_id
    add_index :servers, :category_id
    add_index :servers, :service_id
  end
end
