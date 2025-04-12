# syntax=docker/dockerfile:1
FROM ubuntu:latest

# システムのアップデートと必要なパッケージのインストール
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

# python3 を python コマンドとして使用できるように設定（必要に応じて）
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# FastAPI と Uvicorn のインストール
RUN pip3 install fastapi[all] uvicorn[all]

# 作業ディレクトリの設定
WORKDIR /app

# FastAPI を使用するポート（例：8000）を公開
EXPOSE 8000

# コンテナ起動時に対話形式（bashシェル）で起動する設定
CMD ["/bin/bash"]