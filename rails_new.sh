#!/bin/bash

set -o errexit # エラー発生で終了
set -o nounset # 未定義の変数使用で終了
set -o pipefail # パイプの途中のエラーで終了
set -o xtrace # 実行されたコマンドを表示する

# set -eux より明示的に書く

RUBY_VERSION="2.7.1"
RAILS_VERSION="6"

docker run --rm -v `pwd`:/usr/src/app ruby:${RUBY_VERSION} sh -c \
"
gem install rails && rails new /usr/src/app --database postgresql --skip-test --skip-turbolinks --git --skip-bundle --skip-webpack-install --version ${RAILS_VERSION}
"
touch Gemfile.lock

