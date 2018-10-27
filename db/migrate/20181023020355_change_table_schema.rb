class ChangeTableSchema < ActiveRecord::Migration[5.2]

  def self.up

    change_table(:aulas) do |t|
      t.references :docente, foreign_key: true
      t.references :programa, foreign_key: true
      t.index [:docente_id, :programa_id], unique: true

      t.remove_references :docente_programa
    end

    change_table(:entradas) do |t|
      t.string :titulo
      t.string :resumen
    end

    change_table(:estudiantes) do |t|
      t.timestamps null: true
    end

    change_table(:registro_actividads) do |t|
      t.string :ip_origen
    end

    change_table(:usuarios) do |t|
      t.date :last_login
    end

  end

  def self.down


    change_table(:aulas) do |t|
      t.remove :docente_id
      t.remove :programa_id

      t.references :docente_programa, foreign_key: true
    end

    change_table(:entradas) do |t|
      t.remove :titulo
      t.remove :resumen
    end

    change_table(:estudiantes) do |t|
      t.remove_timestamps
    end

    change_table(:registro_actividads) do |t|
      t.remove :ip_origen
    end

    change_table(:usuarios) do |t|
      t.remove :last_login
    end

  end
end
