GREETING_TEXT = 'こんにちは！'

## <コマンド名>: 
##   <呼び出されるルール>
## 今回の場合は`$ make hello`を叩くと`echo 'Hello, world!'`が実行される
hello:
	echo 'Hello, world!'

## 変数を使用することも可能
## $(変数名)にて事前に参照している変数を使用することができる
greet: 
	echo $(GREETING_TEXT)

## ルールの先頭に`@`をつけることでルールをコマンドラインに表示しないようにできる
## 今回の場合は`$ make yay`を叩くと`Yay!`のみが表示される
yay:
	@echo 'Yay!'

## ファイルの出力も可能
annyong:
	@cat greeting.txt

## <コマンド名>: <前提条件>
##   <呼び出されるルール>
## 前提条件を指定することで、前提条件を実行した後に指定したルールを実行することができる。
## 今回の場合は`$ make annyong-haseyo`を叩くと`annyong`が実行され、その後`annyong-haseyo`が実行される
annyong-haseyo: annyong
	@echo '안녕!'
