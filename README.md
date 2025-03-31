# プログラミング学習支援システム

システムの環境構築と使い方を説明します。

## 1. **システムの概要**

このシステムはプログラミング学習用に開発を行っているwebシステムです。  

### 主な機能：  
#### バックエンド  
Pythonの予約語検知  
全角文字の検知  
C言語の文法確認  
GCCによるC言語のプログラムのコンパイルと実行

#### フロントエンド  
プログラムの入力フォーム  
エラー行に対してコンパイルエラーから線を描画  
解析したエラーの表示
正規の文法を提示

### 環境
#### バックエンド
- サーバーソフト: Apache
- プログラミング言語: PHP
- データベース: MySQL

#### フロントエンド
- サーバーソフト: Node.js
- フレームワーク: Next.js
- プログラミング言語: TypeScript (JavaScript)
- CSS: Tailwind


## 2. **導入手順**

### システムのダウンロード
Teamsとgitからどちらからでも大丈夫です。

Teams(星野研究室)  
git:https://github.com/l36-hoshino/web-programming-learning-system

#### フォルダー名：web-programing-learning-system

中に以下のフォルダーがあるか確認してください。

1. backend-analysis-program-php  
2. backend-compile-and-run-php  
3. frontend-programing-learning-system-next
4. SQLData

### 使用するソフトウェアのダウンロードとインストールと初期設定

#### 1. phpとMySQL(xamppでも可)

xamppを使うかApache+MySQLの環境を自分で整えるか選んでください。  
※xamppだとできない処理あり

xamppのダウンロード  
URL: https://www.apachefriends.org/jp/index.html  

or

##### Apache
URL: https://www.apachelounge.com/download/  
起動コマンド: httpd -k start  
停止コマンド: httpd -k stop  
##### MySQl
URL: https://www.mysql.com/jp/downloads/  
参考URL: https://qiita.com/aki_number16/items/bff7aab79fb8c9657b62

##### データベースをインポートする

xampp起動状態で  
URL: localhost/phpmyadmin/index.php

xamppではない場合、phpmyadminを入れてアクセスしてください。

この際のアカウント名とパスワードはシステムでも使います。

データベース"c_learning_systemdb"作成した後  
SQLDataファルダーの中のc_learning_systemdb.sqlをインポート

##### バックエンドにプログラムを移す

xampp or Apacheのhtdocsに、  
backend-analysis-program-php  
backend-compile-and-run-php  
を入れてください。

xamppのサーバー起動して

以下のURLにアクセスし、同じ結果が得られてれば問題ないです。  
URL: http://localhost/backend-compile-and-run-php/compile_and_run_api.php  
結果：{"compileErrorExecutionResult":"Error: Invalid request method."}  
URL: http://localhost/backend-analysis-program-php/analysis_error_api.php　  
結果：{"print_error_messages":[]}  


#### 2. GCC(MinGw)

MinGWのダウンロード
URL: https://sourceforge.net/projects/mingw/  
ダウンロードして開いたら、The GUN C++ Compilerにチェックを入れてインストール  
環境変数のPathにC:\MinGw\bin  追加  
コマンドプロンプトでgcc --versionを打ってバージョン情報が出ていれば問題ないです。

#### 3. Node.js(npm install)

URL: https://nodejs.org/ja/
インストールできたら  
コマンドプロンプトでnode --versionを打ってバージョン情報が出ていれば問題ないです。  
frontend-programing-learning-systemフォルダーを任意の場所に移し、  
コマンドプロンプトでcdでそのディレクトリに移動しnpm installを実行


#### 4. システムの環境変数の構築
frontend-programing-learning-system-nextフォルダーに.env.localファイルを作成し、  
NEXT_PUBLIC_COMPILE_AND_RUN_API_URL=http://localhost/backend-compile-and-run-php/compile_and_run_api.php  
NEXT_PUBLIC_ANALYSIS_ERROR_API_URL=http://localhost/backend-analysis-program-php/analysis_error_api.php  
を記述、htdocsにいれたプログラムのルートです。

backend-analysis-program-phpフォルダーのsearchDB.phpの中の$userと$passを自分のにしてください。


## 3. **使用方法**

frontend-programing-learning-system-nextフォルダーの階層で、npm run devを実行   
URL: http://localhost:3000 にアクセス
C言語のプログラムを入力、コンパイル＆実行を押す上の下三角を押すことでエラー線とバックエンドで解析した結果が出る。

確認用プログラム

#include<stdio.h>
int main(void){for(i in range(5)){printf("a");}　}


## 4. **連絡先**
3cjnm020@hope.tokai-u.jp