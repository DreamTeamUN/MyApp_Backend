class CreateRegistroActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :registro_actividads do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
