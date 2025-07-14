
# SQL Fundamentals – Docker + PostgreSQL Playground

A self‑contained stack for practicing SQL joins, aggregates, and analytics queries.  
Spin up Postgres 16 with one command, load the sample dataset, and connect from DataGrip (or any SQL client) in seconds.

---

## 📂 Project layout

```
SQL_Fundamentals/
├── docker-compose.yml            # infrastructure as code
├── .env                          # DB creds (ignored by Git)
├── init/
│   └── 00_seed_playground_schema.sql # creates & populates tables
└── README.md
```

---

## ⚙️ Prerequisites

* **Docker Desktop** (or Docker Engine + Compose plugin)  
* macOS / Linux / WSL2 shell with `bash`, `git`  
* *(optional)* **DataGrip** – any SQL IDE/psql works

---

## 🚀 Quick‑start

```bash
# clone & enter the repo
git clone https://github.com/<your‑org>/SQL_Fundamentals.git
cd SQL_Fundamentals

# launch Postgres in the background
docker compose up -d

# follow the log (Ctrl‑C to detach)
docker compose logs -f db
```

When you see **“database system is ready to accept connections”** the seed script has finished.

### Default connection parameters

| Host      | Port | Database   | User     | Password |
|-----------|------|------------|----------|----------|
| localhost | 5432 | playground | postgres | changeme |

---

## 🖥️ Connecting from DataGrip

1. **File ▸ New ▸ Data Source ▸ PostgreSQL**  
2. Fill in the values above and click **Test Connection → OK**.  
3. Right‑click the data source ▸ **Refresh** to see the tables.  
4. Double‑click any table ▸ **Jump to Data** or open a new console and query away.

---

## 🛠️ Useful commands

| Action                           | Command                                                         |
|----------------------------------|-----------------------------------------------------------------|
| psql shell                       | `docker compose exec db psql -U postgres playground`            |
| Stop containers (keep data)      | `docker compose down`                                           |
| Stop **and wipe** everything     | `docker compose down -v`                                        |
| Re‑seed after editing SQL        | `docker compose down -v && docker compose up -d`                |
| Tail database log                | `docker compose logs -f db`                                     |

---

## 🔐 Secrets & local state

* `.env` stores `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`.  
* Docker volume **db_data** persists database files outside the container.  
* Both are excluded from Git via `.gitignore`.

---

## 📝 License

MIT (or choose your favourite).  
Dataset provided for educational use only.
