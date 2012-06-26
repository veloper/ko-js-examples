Koexample::Application.routes.draw do
  root :to => "pages#index"

  get 'example/1' => "pages#example1"
  get 'example/2' => "pages#example2"
  get 'example/3' => "pages#example3"
end
