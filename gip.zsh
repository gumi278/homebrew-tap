#!/usr/bin/env zsh

export AUTHOR="gumi278"
export REPO="git-intent-picker"

# エラー発生時にスクリプトを終了する
set -e

# 1. 環境変数のチェック
if [[ -z "$AUTHOR" || -z "$REPO" ]]; then
  echo "Error: 環境変数 AUTHOR と REPO を設定してください。" >&2
  exit 1
fi

# 2. 引数のチェック
if [[ -z "$1" ]]; then
  echo "Usage: AUTHOR=<author> REPO=<repo> $0 <tag_name>" >&2
  exit 1
fi

TAG_NAME="$1"
# GitHubの標準的なソースコードアーカイブ(tar.gz)のURLを構築
URL="https://github.com/${AUTHOR}/${REPO}/archive/refs/tags/${TAG_NAME}.tar.gz"

# 3. 一時ファイルの作成とクリーンアップの予約
TMP_FILE=$(mktemp)
# スクリプト終了時（成功・失敗問わず）に必ず一時ファイルを削除する
trap 'rm -f "$TMP_FILE"' EXIT

# 4. ダウンロードと存在確認
# -s: プログレスバーを非表示
# -S: エラー時は詳細を表示 (-sと併用時)
# -f: HTTP 400以上のエラー(404など)の場合に異常終了する
# -L: リダイレクトに追従する (GitHubアーカイブのDLには必須)
if ! curl -sSfL "$URL" -o "$TMP_FILE"; then
  echo "Error: 指定されたタグのアーカイブが存在しないか、ダウンロードに失敗しました。" >&2
  echo "URL: $URL" >&2
  exit 1
fi

# 5. SHA256の計算と出力 (ファイル名部分をawkで削ってハッシュ値のみにする)
shasum -a 256 "$TMP_FILE" | awk '{print $1}'
