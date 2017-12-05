Rails.application.routes.draw do
  root 'home#index'
  # ホーム画面
  get 'home/index'
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
