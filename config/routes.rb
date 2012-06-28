Koexample::Application.routes.draw do
  root :to => "pages#index"

  get 'examples/1' => "pages#example1"
  get 'examples/2' => "pages#example2"
  get 'examples/3' => "pages#example3"
end
