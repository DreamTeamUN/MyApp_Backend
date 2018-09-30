class CreateAulas < ActiveRecord::Migration[5.2]
  def change
    create_table :aulas do |t|

      t.references :docente_programa , foreign_key: true, null: false #No es una llave compuesta, pero servira por ahora

    end
  end
end
