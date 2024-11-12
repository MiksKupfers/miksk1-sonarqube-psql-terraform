# SonarQube with PostgreSQL Deployment Using Terraform

This repositroy provides all neecessary files and setup to deploy SonarQube which is integrated with PSQL DB in a local Minikube environment using Terraform. Please use `setup.sh` which has been created for an automatic installation.

## Deployed and tested on:

- **Terraform** (v1.9.8)
- **Helm** (v3.16.2)
- **Minikube** (v1.34.0)
- **Docker** (v27.3.1)

## Steps to run locally

### 1. Clone the Repository:
```bash
git clone https://github.com/MiksKupfers/miksk1-sonarqube-psql-terraform.git
cd miksk1-sonarqube-psql-terraform
```

### 2. Make shell script executable:
```bash
chmod +x ./setup.sh
```

### 3. Run the shell script:
```bash
./setup.sh
```
## Issues with the connection to DB:

When PSQL gets deployed SonarQube fails to connect to DB and in the SonarQube pod it throws multiple errors regarding connection to Database. After investigation at this time, I could not find the root cause and issue unfortunately is not fixed.

For debugging purproses connection to PSQL was tested inside of Postgresql pod and it is successful. Executing `\l` and `\du` commands in PSQL it returns expected output:

```
sonarqube_db=# \l
                                                       List of databases
     Name     |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | Locale | ICU Rules |   Access privileges   
--------------+----------+----------+-----------------+-------------+-------------+--------+-----------+-----------------------
 postgres     | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 sonarqube_db | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 template0    | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/postgres          +
              |          |          |                 |             |             |        |           | postgres=CTc/postgres
 template1    | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/postgres          +
              |          |          |                 |             |             |        |           | postgres=CTc/postgres
(4 rows)

sonarqube_db=# \du
                             List of roles
 Role name |                         Attributes                         
-----------+------------------------------------------------------------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS
```
 Also tried to ping PSQL URL and it returned a successful message...
