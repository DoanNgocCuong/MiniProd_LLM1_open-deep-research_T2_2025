# Base image với Node 18
FROM node:18-alpine

# Cài đặt pnpm bằng npm thay vì corepack
RUN npm install -g pnpm

# Tạo thư mục làm việc
WORKDIR /app

# Copy package.json và pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Cài đặt dependencies và các module cần thiết
RUN pnpm install
RUN pnpm add @opentelemetry/api@1.7.0
RUN pnpm add next@14.1.0

# Copy toàn bộ source code
COPY . .

# Kiểm tra biến môi trường trước khi build
RUN if [ -z "$UPSTASH_REDIS_URL" ]; then \
    echo "Warning: UPSTASH_REDIS_URL is not set"; \
    fi

# Build ứng dụng trong quá trình build image
RUN pnpm next build

# Port mà ứng dụng sẽ chạy
EXPOSE 25043

# Chỉ chạy migrations và start app khi container khởi động
CMD ["sh", "-c", "pnpm db:migrate && PORT=25043 HOST=0.0.0.0 pnpm start"] 