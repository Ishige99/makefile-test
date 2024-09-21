GREETING_TEXT = 'こんにちは！'
.DEFAULT_GOAL := help

# <ターゲット>: 
#   <レシピ>
# 今回の場合は`$ make hello`を叩くと`echo 'Hello, world!'`が実行される
hello: ## 英語の挨拶
	echo 'Hello!'

# 変数を使用することも可能
# $(変数名)にて事前に参照している変数を使用することができる
konnichiwa: ## 日本語の挨拶
	echo $(GREETING_TEXT)

# レシピの先頭に`@`をつけることでルールをコマンドラインに表示しないようにできる
# 今回の場合は`$ make yay`を叩くと`Yay!`のみが表示される
yay: ## Yay!
	@echo 'Yay!'

# ファイルの出力も可能
annyong: ## 韓国語の挨拶
	@cat greeting.txt

# <ターゲット>: <前提条件>
#   <レシピ>
# 前提条件を指定することで、前提条件を実行した後に指定したルールを実行することができる。
# 今回の場合は`$ make annyong-haseyo`を叩くと`annyong`が実行され、その後`annyong-haseyo`が実行される
annyong-haseyo: annyong ## 韓国語の挨拶 v2
	@echo '안녕!'

# ターゲット名と同じファイルがあるとエラーになる
# `make: `danke' is up to date.`
# これを防ぐには`.PHONY`を使用する
danke: ## ドイツ語の挨拶（同ファイルがあるのでエラーが出る）
	@echo 'Danke!'

# `.PHONY`を使用しているので`make xiexie`をしてもエラーにならない
# makeの仕様である、コマンド実行時のファイルチェックをスキップしている
# 予期せぬエラーを防ぐ目的としても、基本的に全部のコマンドに書いておくとbetterかもしれない
.PHONY: xiexie
xiexie: ## 中国語の挨拶
	@echo '谢谢!'

.PHONY: help
help: ## 利用可能なコマンドの一覧を表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
