# マルチステージビルド

# デプロイコンテナに配置するバイナリ作成用のコンテナ
FROM golang:1.18.2-bullseys as deploy-builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -trimpath -ldflags "-w -s" -o app

# ---------------------------------------------------------

# デプロイ用コンテナ
FROM debian:bullseye-slim as deploy

RUN apt-get update

COPY --from=deploy-builder /app/app .

CMD ["./app"]

# ---------------------------------------------------------

# ローカル開発用のホットリロード環境
FROM golang:1.18.2 as dev

WORKDIR /app

# https://github.com/cosmtrek/air
RUN go install github.com/cosmtrek/air@latest

CMD ["air"]