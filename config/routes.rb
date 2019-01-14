Rails.application.routes.draw do

##Archivo-Juego

  resources :tipo_juego, only: [] do
    resources :frase, only: [] do
      resources :archivo, only: [] do
        resources :archivo_juegos, only: [:create]
      end
    end
  end

  resources :archivo_juegos, only: [:destroy, :show]

##Archivo

  resources :archivos, except: [:index, :update]

  get 'archivos/:tipo/:id/:page' => 'archivos#index'

##Aulas

  resources :docente_programas, only: [] do
    resources :aulas, only: [:create]
  end

  resources :aulas, except: [:create, :index]

  get 'aulas/:tipo/:id/:page' => 'aulas#index'

##Docente-Programa

  resources :programas, only: [] do

    resources :docentes, only: [] do
      resources :docente_programas, only: [:create]
    end
  end

  resources :docente_programas, only: [:show, :destroy]

  get 'docente_programas/:tipo/:id/:page' => 'docente_programas#index'

##Docentes

  get 'docentes/:page' => 'docentes#index'

  get 'docente/:id' => 'docentes#show'

##Entradas

  resources :usuarios, only: [] do

    resources :entradas, only: [] do
      resources :entradas, only: [:create]
    end

  end

  resources :entradas, except: [:create, :index]

  get 'entradas/:tipo/:id/:page' => 'entradas#index'

##Estudiante-Aula

  resources :estudiantes, only: [] do
    resources :aulas, only: [] do
      resources :estudiante_aulas, only: [:create]
    end
  end

  resources :estudiante_aulas, only: [:show, :destroy]

  get 'estudiante_aulas/:tipo/:id/:page' => 'estudiante_aulas#index'

##Estudiantes

  resources :tutors, only: [] do
    resources :estudiantes, only: [:index, :create]
  end

  resources :estudiantes, except: [:index, :create]

##FrasesPNL

  resources :tipo_usuarios, only: [] do
    resources :frase_pnls, only: [:index, :create]
  end

  resources :frase_pnls, only: [:show, :destroy]

##Frases

  resources :leccions, only: [] do
    resources :frases, only: [:index, :create]
  end

  resources :frases, only: [:show, :destroy]

##Lecciones

  resources :programas, only: [] do
    resources :leccions, only: [:index, :create]
  end

  resources :leccions, only: [:show, :destroy, :update] #TODO:Solo se puede cambiar la semana

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

  resources :estudiantes, only: [] do
    resources :leccions, only: [] do
      resources :tipo_juegos, only: [] do
        resources :puntuacions, only: [:create]
      end
    end
  end

  resources :puntuacions, only: [:show]

  get 'puntuacions/:tipo/:id/:page' => 'puntuacions#index'

##Tipo-Juegos

  resources :tipo_juegos, only: [:show, :index]

##Tipo-Usuarios

  resources :tipo_usuarios, only: [:show, :index]

##Tutores

  get 'tutors/:page' => 'tutors#index'

  get 'tutor/:id' => 'tutors#show'

##Usuarios

  resources :tipo_usuarios, only: [] do
    resources :usuarios, only: [:create]
  end

  resources :usuarios, except: [:create]

##SocialsController

  resources :socials, only: [:create]

##Reporter Controllers

  get 'usuarios/:usuario_id/report' => 'pdf#reporteUsuario'
  get 'estudiantes/:estudiante_id/report' => 'pdf#reporteEstudiante'

##Rutas para validacion

  mount Knock::Engine => "/knock"
  post 'usuario_token' => 'usuario_token#create'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
