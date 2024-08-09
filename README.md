# hr-eng-internship-sample

エンジニア採用 12days インターンシップのサンプルアプリケーション

## Codespaces 利用手順

https://speee.kibe.la/notes/45290

## docker compose の利用手順

インターンでは Codespaces で使うことが大前提ですが、ローカルでも立ち上げられるようになっています。
以下にセットアップなどの手順を記載します。

※ ローカルの Rails とコンフリクトを起こさないようにデフォルトでは Rails のコンテナは立ち上がらないようにしています。利用するときは`--profile rails`を指定してコンテナを起動してください。

### 初回セットアップ

```bash
cd rails/

docker compose --profile rails build --no-cache
docker compose --profile rails run --rm web bin/setup
```

### アプリケーション起動・停止

### 起動

```sh
docker compose --profile rails up -d
```

### 停止

```sh
docker compose --profile rails down
```
