# ゆいたま

## アプリケーション概要

## 担当
  -	ミカエル: bootstrapのデザイン,実装
  -	バル: bootstrapのデザイン,実装
  -	アルパカ: DBから拾ってHTMLに組み込む
  -	ツカチャン: DB作成

## 問題解決

### Homebrewのupdate,upgradeをかけたらサーバーが立たなくなった件について
タイトルのようにbrewで`brew update`もしくは`brew upgrade`をかけたら,`rails s`でサーバーが立たなくなった

### 解決策
全てを消して,再インストール

解決したページはgitの[ここ](https://github.com/Homebrew/homebrew-core/issues/18123)

やったことをいかに追記

```zsh:ターミナル
>brew remove --force ruby
>sudo rm -rf /usr/local/lib/ruby
>brew install ruby
>sudo gem install bundler
>bundle install
>rails db:migrate
>rails s
```

これで動きました！
