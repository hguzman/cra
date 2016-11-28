class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :destinatario
      t.string :direccion
      t.string :ciudad
      t.string :peso
      t.text :observaciones
      t.string :guia
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
