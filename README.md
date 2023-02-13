# マルチステージビルド

## ステージごとのビルド

`--target` オプションで対象のビルドステージを指定する

```bash
docker build -t <image> --target <stage>
```

## ホットリロード環境

[air](https://github.com/cosmtrek/air)

*.air.toml*に設定を記述可能
