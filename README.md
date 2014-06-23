##概要##
href属税の末尾のスラッシュの有無をチェックするツール。
指定したディレクトリ以下の、ソースファイル中のhref属性を探す。
検索対象として、末尾スラッシュの有り/無しを選択可能。


##インストール方法##

    git clone https://github.com/kiriki-qwt/href_trailing_slash_checker

##実行方法##
    
    cd href_trailing_slash_checker
    sh href_trailing_slash_checker.sh '/path/to/dir'

###実行オプション###

*-c: ヒットした行数を表示します
（href属性の数ではなく、それらが含まれる行数であることに注意。1行に2つ含まれていた場合は1つにカウントされる）

*-s: 末尾スラッシュ有り/無しを指定  
　　-s0:末尾スラッシュ無し  
　　-s1:末尾スラッシュ有り  
　　このオプションを指定しない場合、末尾スラッシュ有り/無し両方を検索します。  

*-h: ヘルプを表示


###実行例###

`sh href_trailing_slash_checker.sh -s1 /home/kiriki/flowers`  
/home/kiriki/flowersディレクトリ以下で末尾がスラッシュ有りのhref属性がある行を表示

`sh href_trailing_slash_checker.sh -c -s0 /home/kiriki/animals`  
/home/kiriki/animalsディレクトリ以下で末尾がスラッシュ無しのhref属性を含む行数を表示


##テストコード##

    cd tests
    sh href_trailing_slash_check.test.sh

エラーが起きなければ（何も表示されなければ）大丈夫。エラー起きたら教えてください。
