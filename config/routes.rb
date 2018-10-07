Rails.application.routes.draw do

  #get 'tipo/:id', to: 'tipo_usuarios#show' #Para crear rutas personalizadas

  resources :usuarios do
    resources :entradas
  end

  resources :usuarios do
      resources :registro_actividads
  end

  resources :nivel_accesos do
    resources :entradas
  end

  resources :estudiantes do
      resources :progresos
  end

  resources :estudiantes do
      resources :puntuacions
  end

  resources :leccions do
      resources :progresos
  end

  resources :tutors do
      resources :estudiantes
  end

  resources :docentes do
      resources :aulas
  end

  resources :programas do
      resources :aulas
  end

  resources :programas do
    resources :leccions
  end

  resources :leccions do
    resources :frases
  end

  resources :leccions do
    resources :puntuacions
  end

  resources :tipo_juegos do
    resources :puntuacions
  end

  resources :tipo_juego do
    resources :archivo_juegos
  end

  resources :tipo_actividads do
      resources :registro_actividads
  end

  resources :tipo_usuarios do
    resources :frase_pnls
  end

  resources :tipo_usuarios do
    resources :usuarios
  end

  resources :docente_programas
  resources :estudiante_aulas
  resources :archivos #Solo get y create
  resources :frase_pnls

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
