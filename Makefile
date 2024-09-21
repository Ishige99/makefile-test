GREETING_TEXT = 'こんにちは！'

## <コマンド名>: <呼び出されるルール>
## 今回の場合は`$ make hello`を叩くと`echo 'Hello, world!'`が実行される
hello:
	echo 'Hello, world!'

## 変数を使用することも可能
## $(変数名)にて事前に参照している変数を使用することができる
greet: 
	echo $(GREETING_TEXT)