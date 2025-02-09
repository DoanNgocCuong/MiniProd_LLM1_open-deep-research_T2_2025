
Pass: `c23GjKI4on6AmSzkSmsNuk5xfsdfasf`
---
1. Khởi động: 


Based on the content you provided, the steps to **deploy the server** for this **Open Deep Research project** using **Vercel** are as follows:
---

### **Deployment Process on Vercel**

1. **Clone the Repository**  
   If you haven't already, clone the repository locally using:
```bash
git clone https://github.com/nickscamara/open-deep-research.git
cd open-deep-research
```

```bash
# Di chuyển vào thư mục dự án (nếu chưa ở đó)
cd MiniProd_LLM1_open-deep-research_T2_2025

# Tạo môi trường ảo
python -m venv .venv

# Kích hoạt môi trường ảo (vì bạn đang dùng Linux)
source .venv/bin/activate

# Kiểm tra pip đã được cài đặt trong môi trường ảo
which pip
```

2. **Install Dependencies**  
   The project uses `pnpm` for dependency management, so run:
   ```bash
   pnpm install
   ```
Nếu bug thì: 
```bash
# Kiểm tra Node.js và npm đã được cài đặt
node --version
npm --version

# Cài đặt pnpm thông qua npm
npm install -g pnpm
```


Nếu bug (yêu cầu bản node v18 thì đây) thì: 
```bash
# 1. Xóa phiên bản pnpm hiện tại nếu có
npm uninstall -g pnpm

# 2. Cập nhật Node.js lên phiên bản 18 LTS thông qua nvm
nvm install 18.19.0  # Phiên bản LTS mới nhất của Node.js 18
nvm use 18.19.0

# 3. Kiểm tra phiên bản Node.js
node --version  # Phải hiển thị v18.x.x

# 4. Cài đặt lại pnpm
npm install -g pnpm

# 5. Kiểm tra pnpm
pnpm --version
```
3. **Database Setup**
   Run any necessary database migrations:
   ```bash
   pnpm db:migrate
   ```

4. **Set Up Environment Variables**  
   Use the `.env.example` file as a reference to create your `.env` file:
   ```bash
   cp .env.example .env
   ```

   **Set up environment variables:**  
   - `OPENAI_API_KEY` or `OPENROUTER_API_KEY`  
   - `REASONING_MODEL=deepseek-reasoner` (or choose any reasoning model)  
   - `BYPASS_JSON_VALIDATION=true` (if needed)

   Make sure to configure secrets like the database connection string or API keys properly.

5. **Local Development**
   To test the application locally, run:
   ```bash
   pnpm dev
   ```
   Open your browser at `http://localhost:3000`.

---

### **Deploying on Vercel**

1. **Install Vercel CLI**  
   If you haven't already installed Vercel CLI:
   ```bash
   npm i -g vercel
   ```

2. **Link Vercel to the Project**
   Link your local repository to a Vercel project:
   ```bash
   vercel link
   ```

   This command will create a `.vercel` directory containing deployment configuration.

3. **Pull Vercel Environment Variables**  
   Download and set up the environment variables from Vercel:
   ```bash
   vercel env pull
   ```

4. **Deploy to Vercel**  
   Once everything is set up, you can deploy the project using:
   ```bash
   vercel deploy
   ```
   Alternatively, you can use Vercel's **one-click deployment** from their UI or integrate the repository with GitHub for continuous deployment.

---

### **Post-Deployment**
- Once deployed, visit the URL provided by Vercel.
- The app will use Vercel Postgres and file storage by default unless overridden.

---

**Customization Notes:**  
- To switch models, modify the `REASONING_MODEL` in your `.env` file.
- Use models like OpenAI, DeepSeek, or TogetherAI based on your needs.

Let me know if you need help with a specific step or configuration! 😊


---
```bash   
nhưng cài `pnpm db:migrate` bị lỗi vì nó yêu cầu node-v18 và phiên bản GLIBC 2.28 (trong khi server 2.27 lên 2.28, mình sợ động vào GLIBC server vì thấy bảo nó quan trọng) 
=> Chọn cách giảm version của pnpm
```


```
v18.20.6 is already installed.
Now using node v18.20.6 (npm v)
6d [ubuntu@mgc-dev-3090-01:~/hungdv/cuong_dn]└4 [base] $ nvm use 18
Now using node v18.20.6 (npm v)
6d [ubuntu@mgc-dev-3090-01:~/hungdv/cuong_dn]└4 [base] $ cd MiniProd_LLM1_open-deep-research_T2_2025/
mmain* ± pnpm db:migrate01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] 

Command 'pnpm' not found, did you mean:

  command 'npm' from deb npm

Try: sudo apt install <deb name>

mmain* 127 ± npm install -g pnpmgdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] 
node: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by node)
mmain* 1 ± mgc-dev-3090-01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] 
```


Cài 1 bản pnpm thấp hơn: 
```
npm install -g pnpm@6.34.0
```

Run: 
```
pnpm install 
pnpm db:migrate
```


```
pnpm add react@18.2.0 react-dom@18.2.0

```

```
 pnpm add ws
 ```

```
pnpm install --force

```


=> tóm lại để cài đặt được:
```
pnpm db:migrate
```

nó đòi hỏi node v18.20.6 và GLIBC 2.28
Sau đó tôi đã phải hạ phiên bản của pnpm xuống để cài được. 