# DevSecOps PetStore CI/CD Pipeline
<img width="959" height="470" alt="image (35)" src="https://github.com/user-attachments/assets/5fa625e1-a6bb-415b-9461-a794aaf565b8" />


> A production-ready, security-first CI/CD pipeline for the JPetStore application using Jenkins, Kubernetes, Docker, and modern DevSecOps practices.

![GitHub last commit](https://img.shields.io/github/last-commit/Youngyz1/jpetstore-6)
![GitHub stars](https://img.shields.io/github/stars/Youngyz1/jpetstore-6)
![License](https://img.shields.io/badge/license-MIT-blue)

## 🚀 Quick Overview
<img width="574" height="272" alt="image" src="https://github.com/user-attachments/assets/e277fe64-7463-4439-918f-d34a19ccee00" />


This project demonstrates a complete DevSecOps pipeline that automates building, testing, securing, and deploying the JPetStore application to Kubernetes. Security is integrated at every stage—not bolted on at the end.

### ✨ What It Does

```
GitHub Push
    ↓
Git Checkout
    ↓
Maven Build & Test (74 tests)
    ↓
SonarQube Analysis (Code Quality)
    ↓
OWASP Dependency Check (Vulnerability Scanning)
    ↓
Trivy Image Scan (Container Security)
    ↓
Docker Build & Push to Docker Hub
    ↓
Kubernetes Deployment
    ↓
Health Checks & Auto-Scaling
    ↓
✅ Live on http://your-ip:8081/jpetstore
```

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     AWS Cloud (Production)                   │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────┐         ┌──────────────────────────┐  │
│  │  Jenkins Server  │         │  Kubernetes Cluster      │  │
│  │  (t3.xlarge)     │────────▶│  (Master + Workers)      │  │
│  │                  │         │                          │  │
│  │ • Git Checkout   │         │ • Cilium CNI             │  │
│  │ • Maven Build    │         │ • Pod Auto-scaling       │  │
│  │ • SonarQube      │         │ • Zero-downtime Deploy   │  │
│  │ • OWASP Dep Chk  │         │ • Health Monitoring      │  │
│  │ • Trivy Scan     │         │                          │  │
│  │ • Docker Build   │         │ PetStore App on Port 8081│  │
│  │ • Push to Hub    │         │ (NodePort Service)       │  │
│  └──────────────────┘         └──────────────────────────┘  │
│           │                                                   │
│           ▼                                                   │
│  ┌──────────────────┐                                         │
│  │  Docker Hub      │                                         │
│  │  youngyz1/petstore                                         │
│  └──────────────────┘                                         │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

## 📋 Features

### 🔐 Security-First Pipeline
- **SonarQube** - Static Application Security Testing (SAST)
- **OWASP Dependency Check** - Vulnerability scanning for dependencies
- **Trivy** - Container image vulnerability scanning
- **Pod Security Standards** - Kubernetes security policies
- **Cilium CNI** - eBPF-based secure networking

### 🤖 Full Automation
- Zero manual deployment steps
- Consistent, repeatable builds
- Automatic rollout on successful builds
- Health checks and monitoring

### ☸️ Cloud-Native
- Kubernetes 1.29+ orchestration
- Horizontal Pod Autoscaling (HPA)
- Zero-downtime rolling updates
- Container-based architecture

### 📊 Quality Assurance
- 74 automated unit tests
- Code quality metrics
- Dependency vulnerability scanning
- Container security scanning

## 🛠️ Tech Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Cloud** | AWS | - |
| **OS** | Ubuntu | 24.04 LTS |
| **CI/CD** | Jenkins | 2.452+ |
| **Build** | Maven | 3.9+ |
| **Container** | Docker | 25+ |
| **Runtime** | containerd | 1.7+ |
| **Orchestration** | Kubernetes | 1.29+ |
| **CNI** | Cilium | eBPF-based |
| **Code Quality** | SonarQube | 10.3+ |
| **Dependency Scan** | OWASP Dep Check | Latest |
| **Image Scan** | Trivy | Latest |
| **Automation** | Ansible | 2.17+ |
| **Language** | Java | 17+ |
| **Framework** | Spring Boot | - |
| **App Server** | Tomcat | 9.0 |

## 📦 Prerequisites

### Local Development
- Git
- Java 17+
- Maven 3.9+
- Docker 25+
- kubectl 1.29+

### Infrastructure (AWS)
- 3 EC2 instances (t3.xlarge for Jenkins, t3.large for K8s nodes)
- VPC with proper security groups
- AWS credentials configured
  <img width="959" height="311" alt="image (19)" src="https://github.com/user-attachments/assets/00ab3226-812b-4d97-8a7a-f27ca5487448" />


### Tools Required
- Jenkins 2.452+
- Kubernetes cluster
- Docker Hub account
- SonarQube instance
- GitHub repository

## 🚀 Quick Start

### 1. Clone Repository
```bash
git clone https://github.com/Youngyz1/jpetstore-6.git
cd jpetstore-6
```

### 2. Setup Jenkins Server
```bash
# On Jenkins EC2 instance
ssh -i your-key.pem ubuntu@jenkins-ip
sudo su -
bash setup-jenkins-server.sh
```

### 3. Setup Kubernetes Master
```bash
# On K8s Master EC2 instance
ssh -i your-key.pem ubuntu@k8s-master-ip
sudo su -
bash setup-k8s-master.sh
```

### 4. Setup Kubernetes Worker
```bash
# On K8s Worker EC2 instance
ssh -i your-key.pem ubuntu@k8s-worker-ip
sudo su -
bash setup-k8s-worker.sh

# Join worker to cluster (run on worker)
bash /root/k8s-join-command.sh
```

### 5. Configure Jenkins Pipeline
1. Open Jenkins: `http://jenkins-ip:8090`
2. Create new Pipeline job named "PETSHOP"
3. Copy pipeline script from `Jenkinsfile`
4. Configure credentials (Docker Hub, SonarQube, etc.)
5. Trigger build
<img width="959" height="359" alt="image (32)" src="https://github.com/user-attachments/assets/19dd8a36-0b3e-4a5f-9eae-e20e7f69bd4e" />



### 6. Access Application
```
Application URL: http://your-ip:8081/jpetstore
Jenkins: http://your-ip:8090
SonarQube: http://your-ip:9000
```
<img width="959" height="470" alt="image (35)" src="https://github.com/user-attachments/assets/579f7e50-9298-43df-aaa2-fb979fffa8ae" />


## 📚 Documentation

- **[Architecture Diagram](./docs/DevSecOps-Architecture-Diagram.md)** - Visual overview of all components
- **[Troubleshooting Guide](./docs/DevSecOps-Troubleshooting-Guide.md)** - Solutions to common issues
- **[Setup Guide](./docs/QUICK-START-GUIDE.md)** - Detailed setup instructions
- **[Complete Documentation](./docs/DevSecOps-PetStore-UPDATED-2026.md)** - In-depth technical guide

## 🔧 Configuration

### Jenkins Pipeline Stages
```groovy
1. Checkout              // Clone repository
2. Build                 // Maven compile & package
3. Test                  // Unit tests
4. SonarQube            // Code quality analysis
5. OWASP Dep Check      // Vulnerability scanning
6. Trivy Scan           // Container image scan
7. Docker Build         // Build container image
8. Push to Hub          // Push to Docker Hub
9. Deploy to K8s        // Deploy to Kubernetes
```
<img width="959" height="472" alt="image (31)" src="https://github.com/user-attachments/assets/d6396ec0-c7ad-428a-ad3c-fbafe72fa932" />


### Environment Variables
```bash
DOCKER_USERNAME=youngyz1
DOCKER_IMAGE=youngyz1/petstore
BUILD_NUMBER=<auto-incremented>
KUBECONFIG=/var/lib/jenkins/.kube/config
SONARQUBE_URL=http://localhost:9000
```

### Security Configuration
```yaml
# Pod Security Standards
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: petstore-psp
spec:
  privileged: false
  allowPrivilegeEscalation: false
  requiredDropCapabilities:
    - ALL
```

## 🐛 Troubleshooting

### Common Issues

**Q: kubectl: command not found**
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```
<img width="882" height="422" alt="image (37)" src="https://github.com/user-attachments/assets/d086a9cd-3f6f-4bc3-bbc8-37bec568e7d2" />


**Q: Docker permission denied**
```bash
sudo usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock
sudo systemctl restart jenkins
```

**Q: OWASP Dependency Check NVD API rate limit**
```bash
# Get NVD API key from https://nvd.nist.gov/developers/request-an-api-key
# Add to pipeline: --nvdApiKey YOUR_API_KEY
```
<img width="956" height="465" alt="image (27)" src="https://github.com/user-attachments/assets/fc5e64f5-6185-4b1a-b84c-6cd4cf91e442" />


**Q: Kubernetes nodes NotReady**
```bash
kubectl describe nodes
kubectl get pods -n kube-system | grep cilium
```
<img width="888" height="95" alt="image (34)" src="https://github.com/user-attachments/assets/d55627b7-3d8b-4bdf-80da-b68a56b28139" />


See [Troubleshooting Guide](./docs/DevSecOps-Troubleshooting-Guide.md) for more solutions.

## 📊 Pipeline Statistics

| Metric | Value |
|--------|-------|
| **Pipeline Stages** | 9 |
| **Average Build Time** | ~5 minutes |
| **Unit Tests** | 74 |
| **Security Gates** | 3 |
| **Code Quality Issues Found** | 247 |
| **Vulnerable Dependencies Detected** | 5 |
| **Container Vulnerabilities (HIGH/CRITICAL)** | 5 |
| **Deployment Success Rate** | 100% |

## 🎓 Learning Outcomes

After studying this project, you'll understand:

✅ CI/CD pipeline design and automation
✅ Security integration in DevOps
✅ Kubernetes cluster setup and management
✅ Docker containerization and registry management
✅ Static code analysis and quality gates
✅ Dependency and container vulnerability scanning
✅ Infrastructure as Code with Ansible
✅ Real-world DevOps challenges and solutions

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add improvement'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open a Pull Request

## ⚠️ Known Issues

- OWASP Dependency Check requires NVD API key for full functionality
- Initial Kubernetes setup takes ~15 minutes
- Jenkins pipeline execution is ~5 minutes per build
- Some security tools require additional configuration

## 📝 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## 👨‍💼 Author

**Youngyz1** - DevOps Engineer & Security Enthusiast

- GitHub: [@Youngyz1](https://github.com/Youngyz1)
- LinkedIn: [(https://www.linkedin.com/in/ohia-uche-10ba3b223/))](https://www.linkedin.com/in/ohia-uche-10ba3b223/)
- Email: uche2net@gmail.com

## 🙏 Acknowledgments

- Original JPetStore application by MyBatis
- Jenkins CI/CD community
- Kubernetes documentation
- OWASP for security best practices
- Trivy for container scanning
- SonarQube for code quality analysis

## 📞 Support

Having issues? Check these resources:

1. **[Troubleshooting Guide](./docs/DevSecOps-Troubleshooting-Guide.md)** - Common issues and solutions
2. **[GitHub Issues](https://github.com/Youngyz1/jpetstore-6/issues)** - Search existing issues
3. **[Discussions](https://github.com/Youngyz1/jpetstore-6/discussions)** - Ask questions
4. **Documentation** - Read detailed setup guides

## 🗺️ Roadmap

- [ ] Add ArgoCD for GitOps deployments
- [ ] Integrate Prometheus & Grafana monitoring
- [ ] Add Vault for secrets management
- [ ] Helm charts for package management
- [ ] Multi-environment support (dev/staging/prod)
- [ ] Cost optimization analysis
- [ ] Advanced Kubernetes features
- [ ] Multi-region deployment

## ⭐ If You Like This Project

Please give it a star! It helps others discover the project.

```bash
# Clone and explore
git clone https://github.com/Youngyz1/jpetstore-6.git
cd jpetstore-6

# Read documentation
ls -la docs/

# Follow quick start
cat docs/QUICK-START-GUIDE.md
```

---

**Built with ❤️ using modern DevSecOps practices**

[🔝 Back to top](#devsecops-petstore-cicd-pipeline)
