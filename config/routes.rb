Rails.application.routes.draw do
  resources :users
  mount Knock::Engine => "/knock"
  post 'usuario_token' => 'usuario_token#create'
  #index, create, show, update, destroy

  resources :tipo_actividads, only: [:index, :show, :update]
  resources :nivel_accesos, only: [:index, :show]
  resources :frase_pnls, only: :index


  resources :archivos do
    resources :tipo_juegos, only: [] do
      resources :frase, only: [] do
        resources :archivo_juegos, shallow: true
      end
    end
  end

  resources :docente_programas, only: [] do
    resources :aulas, shallow: true
  end

  resources :programas, only: [:index, :show] do

    resources :leccions

    resources :docentes, only: [] do
      resources :docente_programas, except: :update, shallow: true
    end

  end

  resources :docentes, only: [:index, :show]

  resources :usuarios, except: :create do

    resources :tipo_actividads, only: [] do
      resources :registro_actividads, except: [:destroy, :update], shallow: true
    end

    resources :nivel_accesos, :entradas, only: [] do
      resources :entradas, shallow: true
    end

  end

  resources :tipo_usuarios, only: [:index, :show] do
    resources :frase_pnls, shallow: true

    resources :usuarios, only: [:create, :index]
  end

  resources :estudiantes, only: [:index, :show] do

    resources :leccions, only: [] do
      resources :progresos, except: :destroy, shallow: true

      resources :tipo_juegos, only: [] do
        resources :puntuacions, except: :destroy, shallow: true
      end
    end

    resources :aulas, only: [] do
      resources :estudiante_aulas, except: :update
    end

  end

  resources :leccions, only: [] do
    resources :frases, shallow: true
  end

  resources :tutors, only: [:index, :show] do
    resources :estudiantes, only: [:create, :index]
  end

  resources :tipo_juegos, only: [:index, :show, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
