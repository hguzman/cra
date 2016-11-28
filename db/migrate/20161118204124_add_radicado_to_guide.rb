class AddRadicadoToGuide < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :radicado, :string
  end
end
