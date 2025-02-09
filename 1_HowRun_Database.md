Kiểm tra xem PostgreSQL có đang chạy trên server hay không
Đăng nhập vào server chứa PostgreSQL (nếu bạn có quyền truy cập) và kiểm tra:

bash
Copy
Edit
sudo systemctl status postgresql




Vâng, tôi sẽ giải thích bằng tiếng Việt về vấn đề này.

### Giải thích về `pnpm db:migrate`:

1. Lệnh `pnpm db:migrate` dùng để chạy các migration (cập nhật cấu trúc) cho database
2. Trước khi chạy lệnh này, bạn CẦN phải:
   - Có PostgreSQL đã được cài đặt
   - Tạo sẵn database
   - Có thông tin kết nối database chính xác trong file `.env.local`

### Các bước để fix:

1. **Kiểm tra PostgreSQL**:
````bash
# Kiểm tra PostgreSQL có đang chạy không
sudo systemctl status postgresql

# Nếu chưa chạy thì start
sudo systemctl start postgresql
````

2. **Tạo database**:
````bash
# Đăng nhập vào PostgreSQL với quyền admin
sudo -u postgres psql

# Tạo database mới (thay your_db_name bằng tên bạn muốn đặt)
CREATE DATABASE open_deep_research;

# Kiểm tra database đã được tạo
\l

# Thoát
\q
````

3. **Cấu hình file `.env.local`**:
````plaintext
# Thêm thông tin kết nối database vào file .env.local
POSTGRES_URL=postgres://postgres:postgres@localhost:5432/open_deep_research
````

4. **Thử chạy lại migration**:
````bash
pnpm db:migrate
````

Nếu vẫn gặp lỗi, hãy chia sẻ thông báo lỗi cụ thể để tôi có thể giúp bạn debug tiếp.

### Lưu ý quan trọng:
- Đảm bảo PostgreSQL đã được cài đặt đúng cách
- Kiểm tra quyền truy cập của user PostgreSQL
- Xác nhận port 5432 (port mặc định của PostgreSQL) không bị chặn bởi firewall


=======

```
# Chuyển sang user postgres
sudo -i -u postgres

# Tạo user mới
createuser --interactive --pwprompt
# Nhập tên user
# Nhập password
# Trả lời y/n cho các quyền superuser, create db, create role

# Tạo database
createdb your_database_name

# Thoát khỏi postgres user
exit```


Tôi thấy lỗi cụ thể là `function gen_random_uuid() does not exist`. Hãy fix như sau:

1. Đầu tiên, kết nối vào database của bạn:
`````bash
sudo -u postgres psql open_deep_research
`````

2. Chạy lệnh sau để cài đặt extension:
`````sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;
`````

3. Kiểm tra extension đã được cài đặt:
`````sql
\dx
`````

4. Thoát psql:
`````sql
\q
`````

5. Sau đó chạy lại migration:
`````bash
pnpm db:migrate
`````

Lỗi này xảy ra vì database chưa có extension cần thiết để tạo UUID. Hai extension trên (`uuid-ossp` và `pgcrypto`) đều cung cấp function để tạo UUID. Sau khi cài đặt extension, migration sẽ chạy được bình thường.



```
# Instructions to create a database here: https://vercel.com/docs/storage/vercel-postgres/quickstart
POSTGRES_URL=postgres://doanngoccuong:doanngoccuong@localhost:5432/open_deep_research_doancuong

```

===========
Tóm lại: 

1. Phải tạo database trước => cần tạo user name pasword và database name trước. 
Từ database name đó thì cài: 
```bash
POSTGRES_URL=postgres://doanngoccuong:doanngoccuong@localhost:5432/open_deep_research_doancuong
```

2. Cài đặt được: 
```bash
pnpm db:migrate
```

3. 