# Coffee Log

飲んだコーヒーの種類を細かく記録できるスマートフォンアプリ

バリスタの友人に頼まれ，共同で制作しました（デザインを友人が担当し，自分がプログラム担当）

## サンプル動画

https://github.com/enpitsu882/coffee_log/assets/85406460/b1d71c38-4565-4e7f-9cb0-ba14b94708e2

## 使っている技術

Flutter × Firebase のシンプルなアプリです

| 役割 | 名前 |
|-----------|------------|
| 認証 | Firebase Authentication |
| データベース | Cloud Firestore |
| ルーティング管理 | go_router |
| 状態管理 | provider |
| リリース | Firebase App Distribution |

## ER図

Cloud Firestore 内でのおおまかな図です

Firestore で扱われる時間用のデータ型は timestamp 型となっているので，Firestore への入出力時に変換し，アプリ内では Dart の datetime 型を扱うようにしています

国名コードはアプリ内で国旗を表示させる際に使用します

![coffee_log](https://github.com/enpitsu882/coffee_log/assets/85406460/dd9d345d-0a33-40ef-a95d-5ca01ba894be)
