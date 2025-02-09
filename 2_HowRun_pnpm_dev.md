```bash
6d [ubuntu@mgc-dev-3090-01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] main(+4225/-5144)* ± pnpm db:migrate

> ai-chatbot@0.1.0 db:migrate /home/ubuntu/hungdv/cuong_dn/MiniProd_LLM1_open-deep-research_T2_2025
> npx tsx lib/db/migrate.ts

⏳ Running migrations...
{
  severity_local: 'NOTICE',
  severity: 'NOTICE',
  code: '42P06',
  message: 'schema "drizzle" already exists, skipping',
  file: 'schemacmds.c',
  line: '135',
  routine: 'CreateSchemaCommand'
}
{
  severity_local: 'NOTICE',
  severity: 'NOTICE',
  code: '42P07',
  message: 'relation "__drizzle_migrations" already exists, skipping',
  file: 'parse_utilcmd.c',
  line: '222',
  routine: 'transformCreateStmt'
}
✅ Migrations completed in 31 ms
6d [ubuntu@mgc-dev-3090-01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] main(+4225/-5144)* ± node --version
v16.20.2
6d [ubuntu@mgc-dev-3090-01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] main(+4225/-5144)* ± pnpm dev

> ai-chatbot@0.1.0 dev /home/ubuntu/hungdv/cuong_dn/MiniProd_LLM1_open-deep-research_T2_2025
> next dev --turbo

You are using Node.js 16.20.2. For Next.js, Node.js version "^18.18.0 || ^19.8.0 || >= 20.0.0" is required.
 ELIFECYCLE  Command failed with exit code 1.
6d [ubuntu@mgc-dev-3090-01:~/hungdv/ … /MiniProd_LLM1_open-deep-research_T2_2025]└4 [base] main(+4225/-5144)* 1 ± 
```


=> Mà lên thì cần: GLIBC 2.28, BỊ HỎNG NHIỀU THỨ CÓ THỂ KÉO THEO 
=> DOCKER ĐI 
