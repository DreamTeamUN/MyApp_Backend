Rails.application.routes.draw do
  resources :nivel_accesos
  resources :progresos
  resources :docentes
  resources :tutors
  resources :estudiantes
  resources :estudiante_aulas
  resources :aulas
  resources :docente_programas
  resources :programas
  resources :leccions
  resources :frases
  resources :puntuacions
  resources :tipo_juegos
  resources :archivo_juegos
  resources :archivos
  resources :tipo_actividads
  resources :registro_actividads
  resources :frase_pnls
  resources :tipo_usuarios
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
