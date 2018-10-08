Rails.application.routes.draw do

  #get 'tipo/:id', to: 'tipo_usuarios#show' #Para crear rutas personalizadas
  #index, create, show, update, destroy

  resources :tipo_actividads, only: [:index, :show, :update]
  resources :nivel_accesos, only: [:index, :show]
  resources :frase_pnls, only: :index

  resources :usuarios, except: :create do

    resources :tipo_actividads, only: [] do
      resources :registro_actividads, except: [:destroy, :update]
    end

    resources :nivel_accesos, :entradas, only: [] do
      resources :entradas, shallow: true
    end

  end

  resources :tipo_usuarios, only: [:index, :show] do
    resources :frase_pnls, shallow: true

    resources :usuarios, only: [:create, :index]
  end

  resources :estudiantes do

    resources :leccions, only: [] do
      resources :progresos, except: :destroy
    end

  end

  resources :programas, only: [:index, :show] do

    resources :leccions

    resources :docentes, only: [] do
      resources :docente_programas, except: :update
    end

  end

  resources :leccions, only: [] do
    resources :frases, shallow: true
  end

  resources :docente_programas, only: [] do
    resources :aulas, shallow: true
  end

  resources :docentes, only: [:index, :show]

  resources :tutors, only: [:index, :show] do
    resources :estudiantes, only: :create
  end

  resources :estudiantes, only: [:index, :show] do

    resources :aulas, only: [] do
      resources :estudiante_aulas, except: :update
    end

  end

  resources :tipo_juegos, only: [:index, :show, :update] do
    resources :puntuacions, except: :destroy, shallow: true
  end

  resources :archivos do
    resources :tipo_juegos, only: [] do
      resources :frase, only: [] do
        resources :archivo_juegos, shallow: true
      end
    end
  end

  #resources :entradas ##
  #resources :nivel_accesos, only: [:index, :show] ##
  #resources :progresos, except: :destroy ##
  #resources :docentes, only: [:index, :show] ##
  #resources :tutors, only: [:index, :show] ##
  #resources :estudiantes, only: [:index, :show] ##
  #resources :estudiante_aulas, except: :update ##
  #resources :aulas ##
  #resources :docente_programas, except: :update ##
  #resources :programas, only: [:index, :show] ##
  #resources :leccions ##
  #resources :frases ##
  #resources :puntuacions, except: :destroy ##
  #resources :tipo_juegos, only: [:index, :show, :update] ##
  #resources :archivo_juegos ##
  #resources :archivos ##
  #resources :tipo_actividads, only: [:index, :show, :update] ##
  #resources :registro_actividads, except: [:destroy, :update] ##
  #resources :frase_pnls ##
  #resources :tipo_usuarios, only: [:index, :show] ##
  #resources :usuarios ##


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
