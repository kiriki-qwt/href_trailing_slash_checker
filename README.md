[概要]
URLの末尾のスラッシュの有無をチェックするツール。
レンダリング後のHTMLを解析するのではなく、ソースファイル中のリンク(aタグのhref属性)を探し、
検索条件に合うものを洗い出す。

[ダウンロード]

git clone git@github.com:kiriki-qwt/url_trailing_slash_checker.git

[実行方法]

sh url_trailing_slash_checker.sh '/path/to/dir(=>ココで指定したディレクトリ以下を検索対象とします)'

[オプション]

-c: ヒットした行数のみを表示します
（href属性の数ではなく、それらが含まれる行数であることに注意。1行に2つ含まれていた場合は1つにカウントされる）

-h: ヘルプを表示

-s: 末尾スラッシュ有り/無しを指定 
　　-s0:末尾スラッシュ無しのものを検索
　　-s1:末尾スラッシュ有りのものを検索
　　このオプションを指定しない場合、末尾スラッシュ有り/無し両方を検索します。
　　
実行例)

sh url_trailing_slash_checker.sh -s1 /home/kiriki/flowers
/home/kiriki/flowersディレクトリ以下で末尾がスラッシュ有りのhref属性がある行を表示

sh url_trailing_slash_checker.sh -c -s0 /home/kiriki/animals
/home/kiriki/animalsディレクトリ以下で末尾がスラッシュ無しのhref属性を含む件数を表示


[テストコード]

cd tests
sh url_trailing_slash_check.test.sh

エラーが起きなければ大丈夫
