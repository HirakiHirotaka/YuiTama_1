Rails.application.routes.draw do
  resources :plans
  resources :plans do
	member do
	  get 'show_image'
	end
  end
  post "login" => "utinaantyus#login"
  get "login" => "utinaantyus#login_form"
  post "logout" =>"utinaantyu#logout"

  get 'accept_plan/planMylist'
  get 'accept_plan/planDetail'
  get 'accept_plan/planList'

  get 'plan_consul/consensus'

  get 'provide_plan/planInput'
  get 'provide_plan/regiComp'
  get 'provide_plan/myPlanList'


  resources :utinaantyus
  root 'home#index'
  # ホーム画面
  get 'home/index'
  # プランホーム画面
  get 'home/planHome'
  # ホームからログイン画面
  get 'home/login'

  # 個人情報登録画面
  get 'personal_info/input'
  # 個人情報登録完了画面
  get 'personal_info/regiComp'
  # ウチナーンチュマイページ
  get 'personal_info/mypage'
  # ウチナーンチュプロフィール編集
  get 'personal_info/editProf'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
