FROM ubuntu:latest

# ユーザ'vscode'を作成する
# 他のリポジトリではUSER_UIDがベースのイメージですでに使われている場合は別の値を使っています。
ARG USERNAME=vscode
ARG USER_UID=1500
ARG USER_GID=$USER_UID

# ユーザの作成と`sudo`の利用設定
# 言語・場所設定
RUN apt-get update \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get -y install locales \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# システムのアップデートと必要なパッケージのインストール
# python3 pip curl git vi
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip vim curl git gcc && \
    rm -rf /var/lib/apt/lists/*

# FastAPI と Uvicorn のインストール
#RUN pip install --upgrade pip
#RUN pip install --upgrade setuptools
RUN pip install --break-system-packages flake8 autopep8
RUN pip3 install --break-system-packages "fastapi[all]" uvicorn python-dotenv

# 作業ディレクトリの設定
WORKDIR /app