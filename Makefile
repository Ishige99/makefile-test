GREETING_TEXT = 'こんにちは！'

## <ターゲット>: 
##   <レシピ>
## 今回の場合は`$ make hello`を叩くと`echo 'Hello, world!'`が実行される
hello:
	echo 'Hello, world!'

## 変数を使用することも可能
## $(変数名)にて事前に参照している変数を使用することができる
greet: 
	echo $(GREETING_TEXT)

## レシピの先頭に`@`をつけることでルールをコマンドラインに表示しないようにできる
## 今回の場合は`$ make yay`を叩くと`Yay!`のみが表示される
yay:
	@echo 'Yay!'

## ファイルの出力も可能
annyong:
	@cat greeting.txt

## <ターゲット>: <前提条件>
##   <レシピ>
## 前提条件を指定することで、前提条件を実行した後に指定したルールを実行することができる。
## 今回の場合は`$ make annyong-haseyo`を叩くと`annyong`が実行され、その後`annyong-haseyo`が実行される
annyong-haseyo: annyong
	@echo '안녕!'

## ターゲット名と同じファイルがあるとエラーになる
## `make: `danke' is up to date.`
## これを防ぐには`.PHONY`を使用する
danke: 
	@echo 'Danke!'

## `.PHONY`を使用しているので`make xiexie`をしてもエラーにならない
## makeの仕様である、コマンド実行時のファイルチェックをスキップしている
.PHONY: xiexie
xiexie:
	@echo '谢谢!'