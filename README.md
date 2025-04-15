製作者 : 阿部　祐汰
Docker FastAPI Uvicorn traefik連携外部向けwebserverへようこそ

フォルダ構成と説明
.
├── .DS_Store // 削除予定
├── .devcontainer // プロジェクトの基礎構成Dockerの基礎情報
│   ├── .DS_Store 
│   ├── Dockerfile // Dockerの環境データ
│   ├── devcontainer.json // ローカルファイル作業用 -バインド
│   ├── docker-compose.yml // 複数のコンテナを管理する traefikが入ったミドルウェアコンテナと fastapi uvicorn が入ったコンテナを管理している
│   ├── letsencrypt 
│   │   └── acme.json // 本リポジトリに含まれない 証明書データが入っている
│   ├── traefik.yml // traefikの設定 ポートフォワーディングなど記載
│   └── traefik_dynamic.yml // 本リポジトリに含まれない basic認証のユーザ名、ハッシュ化されたパスワードなどが入っている
├── .gitignore
└── workspace // ローカルと同期した作業スペース 主にfastapiでのアクセスメソッドの実装、HTML置き場
    ├── .DS_Store
    ├── .vscode
    │   └── settings.json
    ├── main.py //main処理 アクセス後こちらのメソッドが呼ばれる
    └── templates
        ├── HomePage.html // ("/") へのアクセス
        └── images こちらの配下にHTMLで使用する画像ファイルを格納する
