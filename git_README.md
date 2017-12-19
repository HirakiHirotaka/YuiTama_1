# gitの主要コマンド

ターミナルでできるように一応,gitコマンドまとめて見たよ！

## [git init] リポジトリの初期化

Gitでバージョン管理をする際,一番最初に行うべきコマンド

`git init`を行うことによって,.gitディレクトリが作成される.

 ``` zsh:local
 >mkdir test
 >cd test
 >git init

```
## [git status] リポジトリの状態を確認

Gitリポジトリの状態を表すためのコマンド.

様々な状態を見ることができる

``` zsh:local
>git status
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working tree clean
```

README.mdをいじる.

``` zsh:local
>vim README.md
>git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

## [git add] ステージ領域へファイルを追加

Gitリポジトリの管理対象とするために`git add`を使って,ステージ領域と呼ばれる場所にファイルを登録する.

``` zsh:local
>git add README.md
>git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   README.md
        modified:   README.txt

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)

  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    README.txt

```

## [git commit] リポジトリの歴史を記録

`git commit`はステージ領域に登録されている時点のファイルをリポジトリの歴史として記録するコマンド.

-mオプションはコメントをそのままかけるので,基本的につけて書いた方がよいかもしれない！
