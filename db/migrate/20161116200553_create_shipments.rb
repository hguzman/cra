class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.date :fecha_envio_at
      t.text :comments

      t.timestamps
    end
  end
end
