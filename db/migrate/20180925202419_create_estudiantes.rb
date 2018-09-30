class CreateEstudiantes < ActiveRecord::Migration[5.2]
  def change
    create_table :estudiantes do |t|

      t.references :usuario , foreign_key: true, null: false
      t.references :tutor , foreign_key: true, null: false

    end
  end
end
