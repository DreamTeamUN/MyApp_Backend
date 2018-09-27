class CreateAulas < ActiveRecord::Migration[5.2]
  def change
    create_table :aulas do |t|

      t.references :docente_programa , foreign_key: true, null: false
      #t.references :programa , foreign_key: true, null: false #Creo que asi no es xD

      t.timestamps
    end
  end
end
