
# SQL Fundamentals – Docker + PostgreSQL Playground

A self-contained stack for practicing SQL joins, aggregates, and analytics queries.
Spin up Postgres 16 with one command, load the sample dataset, and connect from any SQL client in seconds.

---

## 📂 Project Layout

```
SQL_Fundamentals/
├── .gitignore
├── GEMINI.md
├── README.md
├── docker-compose.yml
├── docs/
│   └── erd.png
├── init/
│   └── 00_seed_playground_schema.sql
├── migrations/
│   └── V1__baseline_schema.sql
└── sql/
    ├── aggregations/
    └── joins/
```

---

## ⚙️ Prerequisites

*   **Docker Desktop** (or Docker Engine + Compose plugin)
*   A shell environment (macOS, Linux, WSL2) with `git`.

---

## 🚀 Quick-start

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/christianvuye/sql_fundamentals.git
    cd sql_fundamentals
    ```

2.  **Launch the PostgreSQL container:**
    ```bash
    docker compose up -d
    ```

3.  **Monitor the logs** to see when the database is ready:
    ```bash
    docker compose logs -f db
    ```
    When you see “database system is ready to accept connections,” the seed script has finished.

### Default Connection Parameters

| Host      | Port | Database   | User     | Password |
| :-------- | :--- | :--------- | :------- | :------- |
| localhost | 5432 | playground | postgres | changeme |

---

## 🗃️ Database Schema

*   The `init/00_seed_playground_schema.sql` script creates the tables and populates them with data. This script runs only once when the Docker volume is first created.
*   The `migrations/V1__baseline_schema.sql` file defines the primary and foreign key constraints for the tables, which were not included in the initial seed script.
*   The Entity-Relationship Diagram (ERD) in `docs/erd.png` provides a visual overview of the table structures.

---

## ✍️ SQL Practice

The `sql/` directory is where you can add your own SQL scripts to practice. It's organized into subdirectories for different SQL concepts (e.g., `joins`, `aggregations`).

---

## 🛠️ Useful Docker Commands

| Action                           | Command                                          |
| :------------------------------- | :----------------------------------------------- |
| Connect via psql shell           | `docker compose exec db psql -U postgres playground` |
| Stop containers (persists data)  | `docker compose down`                            |
| Stop and **wipe all data**       | `docker compose down -v`                         |
| Re-apply migrations and re-seed  | `docker compose down -v && docker compose up -d` |
| Tail the database log            | `docker compose logs -f db`                      |

---

## 📝 License

MIT. The dataset is provided for educational use only.
