class CreateTipoActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_actividads do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
