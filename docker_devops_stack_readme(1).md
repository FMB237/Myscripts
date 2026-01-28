# 🧠 Homelab DevOps & Networking Stack – Complete Installation Guide

This guide sets up a powerful self-hosted lab for **DevOps, Cloud, Networking, and Full-Stack Development** using Docker.

---

## 🐳 1. Install Docker

```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
```

Logout and login again.

---

## 📦 2. Portainer (Docker Management UI)

```bash
docker volume create portainer_data

docker run -d -p 9000:9000 -p 9443:9443 \
--name portainer --restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data portainer/portainer-ce
```

Access: [http://localhost:9000](http://localhost:9000)

---

## 🧑‍💻 3. Gitea (Self-Hosted Git Server)

```bash
docker run -d --name gitea -p 3000:3000 -p 2222:22 \
-v gitea_data:/data --restart=always gitea/gitea:latest
```

---

## 🔁 4. Jenkins (CI/CD)

```bash
docker run -d -p 8080:8080 -p 50000:50000 \
--name jenkins --restart=always \
-v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

---

## 🤖 5. n8n (Automation)

```bash
docker run -d --name n8n -p 5678:5678 \
-v n8n_data:/home/node/.n8n --restart=always n8nio/n8n
```

---

## 🧠 6. Flowise (AI Workflow Builder)

```bash
docker run -d --name flowise -p 3001:3000 \
-v flowise_data:/root/.flowise --restart=always flowiseai/flowise
```

---

## 📧 7. MailHog (Mail Testing)

```bash
docker run -d --name mailhog -p 1025:1025 -p 8025:8025 mailhog/mailhog
```

---

## ☁ 8. Nextcloud

```bash
docker run -d -p 8081:80 --name nextcloud \
-v nextcloud_data:/var/www/html nextcloud
```

---

## 🗄 9. MinIO (S3 Storage)

```bash
docker run -d --name minio -p 9001:9000 -p 9002:9001 \
-v minio_data:/data \
-e "MINIO_ROOT_USER=admin" \
-e "MINIO_ROOT_PASSWORD=password123" \
minio/minio server /data --console-address ":9001"
```

---

## 📚 10. Wiki.js

```bash
docker run -d -p 3002:3000 --name wiki \
--restart=always requarks/wiki:2
```

---

## 🌐 11. WordPress

```bash
docker run -d --name wordpress -p 8082:80 wordpress
```

---

## 🍃 12. MongoDB

```bash
docker run -d --name mongodb -p 27017:27017 \
-v mongo_data:/data/db mongo
```

---

## 🐬 13. MySQL

```bash
docker run -d --name mysql_db -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=rootpass \
-e MYSQL_DATABASE=appdb \
-e MYSQL_USER=appuser \
-e MYSQL_PASSWORD=apppass \
-v mysql_data:/var/lib/mysql mysql:8.0
```

---

## 🧪 14. GNS3 Server (Docker Mode)

```bash
docker run -d --name gns3 --privileged \
-p 3080:3080 -p 5000-5100:5000-5100 \
-v gns3_data:/data gns3/gns3server
```

Install GNS3 GUI locally and connect to port **3080**.

---

## 🧰 15. Extra DevOps Tools

### Redis

```bash
docker run -d --name redis -p 6379:6379 redis
```

### PostgreSQL

```bash
docker run -d --name postgres -p 5432:5432 \
-e POSTGRES_PASSWORD=postgres postgres
```

### Watchtower (Auto-update containers)

```bash
docker run -d --name watchtower \
-v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
```

---

## 🖥 16. PhpMyAdmin (MySQL GUI)

```bash
docker run -d \
  --name phpmyadmin \
  -e PMA_HOST=host.docker.internal \
  -e PMA_PORT=3306 \
  -p 8083:80 \
  --restart=always \
  phpmyadmin/phpmyadmin
```

Access in browser: `http://localhost:8083` and connect with **root/appuser/Bruce** users.

---

## 🎯 Your Lab Now Supports

* CI/CD pipelines (Jenkins)
* Git hosting (Gitea)
* Automation (n8n)
* AI workflows (Flowise)
* Cloud storage (MinIO)
* Collaboration (Nextcloud, Wiki)
* Networking labs (GNS3)
* Databases (MongoDB, MySQL, PostgreSQL)
* Web hosting (WordPress)
* Container management (Portainer)
* Database GUI management (PhpMyAdmin, Antares SQL, DBeaver)

---

🚀 You now have a **complete DevOps + Networking Homelab Platform**.
