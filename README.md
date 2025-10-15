# 🐳 DevOps Todo API — Dockerized Multi-Container Application

A hands-on **DevOps practice project** to learn and implement **Docker Compose**, **Terraform**, **Ansible**, and **CI/CD pipelines** using a real-world Node.js + MongoDB application.

---

## 🎯 Project Goal

The goal of this project is to **practice running a multi-container application in production** using Docker Compose.  
It includes everything from **building a Node.js API**, connecting it to **MongoDB**, deploying with **Terraform + Ansible**, and setting up a **CI/CD pipeline**.

---

## 🧱 Core Features

### 🧩 RESTful API Endpoints
| Method | Endpoint | Description |
|---------|-----------|-------------|
| GET | `/todos` | Get all todos |
| POST | `/todos` | Create a new todo |
| GET | `/todos/:id` | Get a single todo by ID |
| PUT | `/todos/:id` | Update a todo by ID |
| DELETE | `/todos/:id` | Delete a todo by ID |

- Built using **Express.js**
- Data persistence with **MongoDB** using **Mongoose**
- **Nodemon** for live reloading during development

---

## ⚙️ Requirements

### 🐋 Requirement #1: Dockerize the API
- Use `Dockerfile` and `docker-compose.yml` to run two containers:
  - **Node.js API container**
  - **MongoDB container**
- Persist MongoDB data using volumes.
- Access the API via `http://localhost:3000`.

### ☁️ Requirement #2: Setup a Remote Server
- Use **Terraform** to provision a remote server (AWS/DigitalOcean/etc).
- Use **Ansible** to:
  - Install Docker and Docker Compose
  - Pull the image from Docker Hub
  - Run the containers on the remote server

### 🔄 Requirement #3: Setup a CI/CD Pipeline
- Use **GitHub Actions** to automate deployment:
  - On push to main branch → build Docker image → push to Docker Hub → trigger remote deployment.
- Use `docker-compose` in production for consistent deployment.

### 🎁 Bonus: Reverse Proxy with NGINX
- Configure **NGINX** as a reverse proxy container via Docker Compose.
- Access app via `http://your_domain.com` instead of the IP address.

---

## 🗂️ Project Structure

```
.
├── ansible/
│   ├── deploy.yml
│   └── inventory.ini
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── nginx/
│   └── nginx.conf
│
├── src/
│   ├── index.js
│   ├── routes/
│   │   └── todos.js
│   └── models/
│       └── todo.js
│
├── Dockerfile
├── docker-compose.yml
├── docker-compose.prod.yml
├── package.json
├── package-lock.json
├── .gitignore
└── README.md
```

---

## 🚀 How to Run Locally

### Step 1: Clone Repository
```bash
git clone https://github.com/<your-username>/dockerized-todo-api.git
cd dockerized-todo-api
```

### Step 2: Build and Start Containers
```bash
docker-compose up --build
```

### Step 3: Verify
- API is running → `http://localhost:3000`
- MongoDB container is running → check with `docker ps`
- Persistent data saved inside Docker volume.

---

## ☁️ Deploying to Cloud

1. **Provision EC2 or Droplet** with Terraform
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

2. **Configure Server with Ansible**
   ```bash
   cd ansible
   ansible-playbook -i inventory.ini deploy.yml
   ```

3. **Access the Application**
   - Visit your public IP or domain: `http://your_domain.com`

---

## 🔁 CI/CD Pipeline with GitHub Actions

- Automatically builds and deploys on every push to `main`
- Uses secrets for AWS and Docker Hub authentication
- Workflow outline:
  1. Checkout code  
  2. Build Docker image  
  3. Push image to Docker Hub  
  4. SSH into remote server  
  5. Pull latest image & restart containers

---

## 🧱 .gitignore Example

```
node_modules/
npm-debug.log
.env

# Terraform
terraform/.terraform/
terraform.tfstate
terraform.tfstate.backup

# Ansible
*.retry

# Docker
*.pid
*.log

# System files
.DS_Store
.idea/
.vscode/
```

---

## 💡 Learning Outcomes

By completing this project, we’ll learn how to:
- Containerize and run multi-service applications with Docker Compose
- Use Terraform to create cloud infrastructure (IaC)
- Configure servers with Ansible
- Build a CI/CD pipeline with GitHub Actions
- Set up reverse proxy with NGINX for production-grade deployment

---

## 👨‍💻 Author

**Arunesh Dwivedi**  
🌍 DevOps & Cloud Engineer in progress  
🚀 Passionate about Infrastructure Automation and Cloud Deployments  
📫 [GitHub](https://github.com/AruneshDwivedi)

---

## 🪄 Future Enhancements

- Add authentication and JWT tokens
- Integrate Prometheus + Grafana for monitoring
- Enable HTTPS via Let's Encrypt
- Add automated testing and health checks

---

### 🧠 Final Thought
> *"DevOps is not just about tools. It’s about building reliable, reproducible, and automated systems — and this project is your first step there."*
