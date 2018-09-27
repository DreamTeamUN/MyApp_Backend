class CreateRegistroActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :registro_actividads do |t|
      t.date :fecha, null: false

      t.references :usuario , foreign_key: true, null: false
      t.references :tipo_actividad, foreign_key: true, null: false

      t.timestamps
    end
  end
end
