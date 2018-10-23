Rails.application.routes.draw do

##Archivo-Juego

  resources :archivos, only: [] do
    resources :tipo_juegos, only: [] do
      resources :frase, only: [] do
        resources :archivo_juegos, only: [:create, :index]
      end
    end
  end

  resources :archivo_juegos, except: [:create, :index]

##Archivo

  resources :archivos

##Aulas

  resources :docente_programas, only: [] do
    resources :aulas, only: [:create, :index]
  end

  resources :aulas, except: [:create, :index]

##Docente-Programa

  resources :docentes, only: [] do
    resources :docente_programas, only: [:index]
  end

  resources :programas, only: [] do
    resources :docente_programas, only: [:index]

    resources :docentes, only: [] do
      resources :docente_programas, only: [:create]
    end
  end

  resources :docente_programas, only: [:show, :destroy]

##Docentes

  resources :docentes, only: [:index, :show]

##Entradas

  resources :usuarios, only: [] do

    resources :entradas, only: [] do
      resources :entradas, only: [:create]
    end

    resources :entradas, only: [:index]
  end

  resources :nivel_accesos, only: [] do
    resources :entradas, only: [:index]
  end

  resources :entradas, except: [:index, :create]

##Estudiante-Aula

  resources :aulas, only: [] do
    resources :estudiante_aulas, only: [:index]
  end

  resources :estudiantes, only: [] do
    resources :estudiante_aulas, only: [:index]

    resources :aulas, only: [] do
      resources :estudiante_aulas, only: [:create]
    end
  end

  resources :estudiante_aulas, only: [:show, :destroy]

##Estudiantes

  resources :tutors, only: [] do
    resources :estudiantes, only: [:index, :create]
  end

  resources :estudiantes, only: [:index, :show]

##FrasesPNL

  resources :tipo_usuarios, only: [] do
    resources :frase_pnls, only: [:index, :create]
  end

  resources :frase_pnls, except: [:create]

##Frases

  resources :leccions, only: [] do
    resources :frases, only: [:index, :create]
  end

  resources :frases, except: [:index, :create]

##Lecciones

  resources :programas, only: [] do
    resources :leccions, only: [:index, :create]
  end

  resources :leccions, except: [:index, :create]

##Niveles-Acceso

  resources :nivel_accesos, only: [:index, :show]

##Programas

  resources :programas, only: [:index, :show]

##Progresos

  resources :leccions, only: [] do
    resources :progresos, only: [:index]
  end

  resources :estudiantes, only: [] do
    resources :leccions, only: [] do
      resources :progresos, only: [:create, :index]
    end

    resources :progresos, only: [:index]
  end

  resources :progresos, only: [:show, :update]

##Puntuaciones

  resources :tipo_juegos, only: [] do
    resources :puntuacions, only: [:index]
  end

  resources :leccions, only: [] do
    resources :puntuacions, only: [:index]
  end

  resources :estudiantes, only: [] do
    resources :leccions, only: [] do
      resources :tipo_juegos, only: [] do
        resources :puntuacions, only: [:create]
      end
    end

    resources :puntuacions, only: [:index]
  end

  resources :puntuacions, only: [:show, :update]

##Registro-Actividades

  resources :tipo_actividads, only: [] do
    resources :registro_actividads, only: [:index]
  end

  resources :usuarios, only: [] do
    resources :tipo_actividads, only: [] do
      resources :registro_actividads, only: [:create]
    end

    resources :registro_actividads, only: [:index]
  end

  resources :registro_actividads, only: [:show]

##Tipo-Actividades

  resources :tipo_actividads, only: [:show, :index, :update]

##Tipo-Juegos

  resources :tipo_juegos, only: [:show, :index, :update]

##Tipo-Usuarios

  resources :tipo_usuarios, only: [:show, :index]

##Tutores

  resources :tutors, only: [:show, :index]

##Usuarios

  resources :tipo_usuarios, only: [] do
    resources :usuarios, only: [:index, :create]
  end

  resources :usuarios, except: [:create]

##Reporter Controllers

  get 'usuarios/:usuario_id/report' => 'pdf#reporteUsuario'
  get 'estudiantes/:estudiante_id/report' => 'pdf#reporteEstudiante'

##Rutas para validacion

  mount Knock::Engine => "/knock"
  post 'usuario_token' => 'usuario_token#create'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
