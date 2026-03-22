# 🗺️ Linux & Cloud Mastery Journey

### Zero → Senior SRE / DevOps / Platform / MLOps Engineer

<div align="center">

![Journey Started](https://img.shields.io/badge/Journey%20Started-March%202026-78C850?style=for-the-badge&logo=linux&logoColor=white)
![Current Phase](https://img.shields.io/badge/Current%20Phase-1%20%7C%20Linux%20Roots-4F9EFF?style=for-the-badge&logo=ubuntu&logoColor=white)
![Chapters Done](https://img.shields.io/badge/Chapters%20Done-1%20%2F%20115-00D4A8?style=for-the-badge&logo=checkmarx&logoColor=white)
![Overall Progress](https://img.shields.io/badge/Overall%20Progress-1%25-FFD166?style=for-the-badge)

![GCP](https://img.shields.io/badge/Primary%20Cloud-GCP-4285F4?style=flat-square&logo=googlecloud&logoColor=white)
![AWS](https://img.shields.io/badge/Also%20Learning-AWS-FF9900?style=flat-square&logo=amazonaws&logoColor=white)
![Azure](https://img.shields.io/badge/Also%20Learning-Azure-0078D4?style=flat-square&logo=microsoftazure&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Target-Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Target-Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![eBPF](https://img.shields.io/badge/Cutting%20Edge-eBPF-FF6B6B?style=flat-square&logo=linux&logoColor=white)
![LLMOps](https://img.shields.io/badge/AI%20Track-LLMOps-C77DFF?style=flat-square&logo=openai&logoColor=white)
![Kafka](https://img.shields.io/badge/Data-Kafka-231F20?style=flat-square&logo=apachekafka&logoColor=white)

</div>

---

> **"The journey of a thousand miles begins with a single step. You've already taken it."**
>
> This repository is my **public learning journal** — every chapter completed, every command run, every project shipped, every war story absorbed. Curriculum designed by a 25-year MAANG veteran, then **reviewed and hardened** by a Senior Engineer (ex-Google + ex-AWS) who identified critical cutting-edge gaps needed to crack L5/L6 roles in 2026+.
>
> **Core philosophy:** Move from _"I know how to run this tool"_ → _"I know how to design systems that scale, secure, and finance themselves."_

---

## ⚡ v2.0 Upgrade — What Changed & Why

> _A Senior Engineer (ex-Google + ex-AWS) reviewed this syllabus on Topmate.io and identified 5 critical gaps for Senior (L5/L6/E5+) roles. Every gap has been integrated._

| #   | Gap Identified                 | Root Cause                                                                       | What Was Added                                | Where                    |
| --- | ------------------------------ | -------------------------------------------------------------------------------- | --------------------------------------------- | ------------------------ |
| 1   | **Senior Soft Skills**         | Seniors are hired for _impact & influence_, not just tool knowledge              | ADRs + Incident Command (War Room Leadership) | Phase 9: Ch 9.10–9.11    |
| 2   | **eBPF**                       | The future of Platform/SRE. Cilium replacing kube-proxy, kernel debugging, Pixie | eBPF deep dive                                | Phase 3: Ch 3.8          |
| 3   | **Zero Trust / SPIFFE/SPIRE**  | Workload identity at scale across multi-cluster, multi-cloud                     | SPIFFE/SPIRE architecture                     | Phase 3: Ch 3.9          |
| 4   | **GPU Scheduling in K8s**      | GPUs are the most expensive cloud resource. NVIDIA Device Plugin, MIG slicing    | GPU orchestration chapter                     | Phase 4: Ch 4.13         |
| 5   | **LLMOps / Generative AI**     | Market shifted — RAG, vector DBs, hallucination monitoring, inference cost       | 4 new LLMOps chapters                         | Phase 10: Ch 10.11–10.14 |
| 6   | **Kafka & Streaming at Scale** | Data pipeline is often the most critical infra at FAANG                          | Full Kafka + stream processing                | Phase 12: Ch 12.1–12.8   |
| 7   | **Database Internals**         | Senior interviews ask MVCC, WAL, B-tree, replication lag                         | PostgreSQL/MySQL internals                    | Phase 12: Ch 12.9–12.13  |

> **Result: 11 phases → 12 phases · 98 chapters → 115 chapters · ~14 months → ~17 months**

---

## 📊 Overall Progress

```
Phase  1 │ 🌱 Linux Roots                   │ ██░░░░░░░░ │  1/10  │  10%
Phase  2 │ 🧙 Shell Sorcery                 │ ░░░░░░░░░░ │  0/8   │   0%
Phase  3 │ 🕸️  Network Ninja   [+eBPF +SPIFFE]│ ░░░░░░░░░░ │  0/9   │   0%
Phase  4 │ 🚢 Container Cmd   [+GPU K8s]    │ ░░░░░░░░░░ │  0/13  │   0%
Phase  5 │ ☁️  Cloud Conqueror               │ ░░░░░░░░░░ │  0/9   │   0%
Phase  6 │ 🏗️  Infra Alchemist               │ ░░░░░░░░░░ │  0/9   │   0%
Phase  7 │ 🔭 Observability Oracle          │ ░░░░░░░░░░ │  0/10  │   0%
Phase  8 │ 🚀 CI/CD Champion               │ ░░░░░░░░░░ │  0/9   │   0%
Phase  9 │ 🥷 SRE Sensei    [+ADR +IncCmd]  │ ░░░░░░░░░░ │  0/11  │   0%
Phase 10 │ 🤖 MLOps+LLMOps [+RAG +GPU inf] │ ░░░░░░░░░░ │  0/14  │   0%
Phase 11 │ 🏆 Interview Domination          │ ░░░░░░░░░░ │  0/5   │   0%
Phase 12 │ 🌊 Data & Streaming  [NEW]       │ ░░░░░░░░░░ │  0/13  │   0%
─────────┼──────────────────────────────────┼───────────┼────────┼──────
 TOTAL   │ All 12 Phases                    │ ░░░░░░░░░░ │ 1/115  │   1%
```

---

## 🗂️ Repository Structure

```
linux-cloud-mastery/
│
├── 📄 README.md                         ← You are here (master tracker)
├── 📊 tracker.xlsx                      ← Excel daily tracker
│
├── phase-01-linux-roots/
│   ├── README.md
│   ├── ch-1.1-linux-universe/
│   │   ├── README.md  ✅               ← Chapter notes, commands, learnings
│   │   └── commands.sh
│   └── ch-1.2 to ch-1.10/ ...
│
├── phase-02-shell-sorcery/
├── phase-03-network-ninja/              ← +Ch 3.8 eBPF  +Ch 3.9 SPIFFE/SPIRE
├── phase-04-container-commander/        ← +Ch 4.13 GPU Scheduling in K8s
├── phase-05-cloud-conqueror/
├── phase-06-infra-alchemist/
├── phase-07-observability-oracle/
├── phase-08-cicd-champion/
├── phase-09-sre-sensei/                 ← +Ch 9.10 Incident Command  +Ch 9.11 ADRs
├── phase-10-mlops-llmops/               ← +Ch 10.11–10.14 LLMOps expansion
├── phase-11-interview-domination/
├── phase-12-data-streaming/             ← NEW PHASE: Kafka + DB Internals
│
└── projects/
    ├── p01 through p10/
    └── ...
```

---

## 📋 Full Chapter Checklist

---

### 🌱 Phase 1 — Linux Roots `[1/10]` `~4 weeks`

| #    | Chapter                       | Status         | Done       | Score | Notes                                                                |
| ---- | ----------------------------- | -------------- | ---------- | ----- | -------------------------------------------------------------------- |
| 1.1  | 🗺️ The Linux Universe Map     | ✅ Done        | 2026-03-21 | 9/10  | [View Notes](./phase-01-linux-roots/ch-1.1-linux-universe/README.md) |
| 1.2  | 🏰 The Filesystem Kingdom     | ⏳ Not Started | —          | —     | —                                                                    |
| 1.3  | 🔑 Permissions & Powers       | ⏳ Not Started | —          | —     | —                                                                    |
| 1.4  | ⚙️ Process Playground         | ⏳ Not Started | —          | —     | —                                                                    |
| 1.5  | 📦 Package Wizardry           | ⏳ Not Started | —          | —     | —                                                                    |
| 1.6  | 💾 Storage & Disk Universe    | ⏳ Not Started | —          | —     | —                                                                    |
| 1.7  | 🧠 Memory & CPU Deep Dive     | ⏳ Not Started | —          | —     | —                                                                    |
| 1.8  | 📜 Systemd & Boot Saga        | ⏳ Not Started | —          | —     | —                                                                    |
| 1.9  | 🔐 SSH: Your Magic Teleporter | ⏳ Not Started | —          | —     | —                                                                    |
| 1.10 | 🔍 The Text Superpowers       | ⏳ Not Started | —          | —     | —                                                                    |

---

### 🧙 Phase 2 — Shell Sorcery `[0/8]` `~4 weeks`

| #   | Chapter                      | Status         | Done | Score | Notes |
| --- | ---------------------------- | -------------- | ---- | ----- | ----- |
| 2.1 | 🐚 Shell Anatomy 101         | ⏳ Not Started | —    | —     | —     |
| 2.2 | 🎮 Variables & Control Flow  | ⏳ Not Started | —    | —     | —     |
| 2.3 | 🔄 I/O Redirection Mastery   | ⏳ Not Started | —    | —     | —     |
| 2.4 | 🕷️ Advanced Text Processing  | ⏳ Not Started | —    | —     | —     |
| 2.5 | ⚡ Python for SRE/DevOps     | ⏳ Not Started | —    | —     | —     |
| 2.6 | 🤖 Automation Patterns       | ⏳ Not Started | —    | —     | —     |
| 2.7 | 🛡️ Script Security           | ⏳ Not Started | —    | —     | —     |
| 2.8 | 📊 Real-World Script Library | ⏳ Not Started | —    | —     | —     |

---

### 🕸️ Phase 3 — Network Ninja `[0/9]` `~4 weeks` _(+2 cutting-edge chapters)_

| #   | Chapter                                            | Status         | Done | Score | Notes |
| --- | -------------------------------------------------- | -------------- | ---- | ----- | ----- |
| 3.1 | 🌐 TCP/IP & the OSI Model                          | ⏳ Not Started | —    | —     | —     |
| 3.2 | 🔤 DNS Deep Dive                                   | ⏳ Not Started | —    | —     | —     |
| 3.3 | 🚦 Load Balancers & Proxies                        | ⏳ Not Started | —    | —     | —     |
| 3.4 | 🔒 TLS/SSL Deep Dive                               | ⏳ Not Started | —    | —     | —     |
| 3.5 | 🔥 Firewalls & Network Policies                    | ⏳ Not Started | —    | —     | —     |
| 3.6 | 🕵️ Network Debugging Toolkit                       | ⏳ Not Started | —    | —     | —     |
| 3.7 | 🌩️ CDN & Edge Computing                            | ⏳ Not Started | —    | —     | —     |
| 3.8 | 🔬 **eBPF — The Future of Kernel Networking** `🆕` | ⏳ Not Started | —    | —     | —     |
| 3.9 | 🪪 **Zero Trust, SPIFFE & SPIRE at Scale** `🆕`    | ⏳ Not Started | —    | —     | —     |

> **Ch 3.8 — eBPF:** Run sandboxed programs inside the Linux kernel without changing kernel source. Powers Cilium (replaces kube-proxy), Pixie (zero-instrumentation observability), Falco (runtime security). Expected knowledge at senior Platform/SRE level at Google/Meta.
>
> **Ch 3.9 — SPIFFE/SPIRE:** The CNCF standard for workload identity. How do you issue and auto-rotate the certificates that power mTLS — across 50 clusters, 3 clouds, automatically? This is what mature multi-cluster zero-trust looks like in production.

---

### 🚢 Phase 4 — Container Commander `[0/13]` `~6 weeks` _(+1 GPU chapter)_

| #    | Chapter                                           | Status         | Done | Score | Notes |
| ---- | ------------------------------------------------- | -------------- | ---- | ----- | ----- |
| 4.1  | 📦 Docker Deep Dive                               | ⏳ Not Started | —    | —     | —     |
| 4.2  | 🧱 Container Internals                            | ⏳ Not Started | —    | —     | —     |
| 4.3  | ☸️ Kubernetes Architecture                        | ⏳ Not Started | —    | —     | —     |
| 4.4  | 🏗️ K8s Core Objects                               | ⏳ Not Started | —    | —     | —     |
| 4.5  | 🔌 K8s Services & Networking                      | ⏳ Not Started | —    | —     | —     |
| 4.6  | 💾 Storage in K8s                                 | ⏳ Not Started | —    | —     | —     |
| 4.7  | ⚖️ Scheduling & Resource Management               | ⏳ Not Started | —    | —     | —     |
| 4.8  | 📈 K8s Autoscaling Trilogy                        | ⏳ Not Started | —    | —     | —     |
| 4.9  | 🛡️ K8s Security Fortress                          | ⏳ Not Started | —    | —     | —     |
| 4.10 | 🕸️ Service Mesh (Istio/Linkerd)                   | ⏳ Not Started | —    | —     | —     |
| 4.11 | 🔧 Helm & Kustomize                               | ⏳ Not Started | —    | —     | —     |
| 4.12 | 🩺 K8s Troubleshooting Playbook                   | ⏳ Not Started | —    | —     | —     |
| 4.13 | 🖥️ **GPU Scheduling & Orchestration in K8s** `🆕` | ⏳ Not Started | —    | —     | —     |

> **Ch 4.13 — GPU in K8s:** NVIDIA Device Plugin (how K8s discovers GPUs), MIG slicing (split one A100 into 7 smaller isolated GPUs), time-slicing, GPU resource quotas per namespace, monitoring GPU utilization with DCGM Exporter + Grafana. Getting GPU scheduling wrong wastes $50K+/month. The #1 differentiator for AI Platform engineers right now.

---

### ☁️ Phase 5 — Cloud Conqueror `[0/9]` `~6 weeks`

| #   | Chapter                            | Status         | Done | Score | Notes |
| --- | ---------------------------------- | -------------- | ---- | ----- | ----- |
| 5.1 | 🏛️ Cloud Architecture & IAM        | ⏳ Not Started | —    | —     | —     |
| 5.2 | 💻 Compute Mastery (GCP/AWS/Azure) | ⏳ Not Started | —    | —     | —     |
| 5.3 | 🌐 Networking in the Cloud         | ⏳ Not Started | —    | —     | —     |
| 5.4 | 🗄️ Storage & Databases             | ⏳ Not Started | —    | —     | —     |
| 5.5 | 📬 Messaging & Events              | ⏳ Not Started | —    | —     | —     |
| 5.6 | ⚡ Serverless                      | ⏳ Not Started | —    | —     | —     |
| 5.7 | 🔐 Cloud Security Deep Dive        | ⏳ Not Started | —    | —     | —     |
| 5.8 | 💰 FinOps & Cost Engineering       | ⏳ Not Started | —    | —     | —     |
| 5.9 | 🛡️ Cloud DR & Multi-Region         | ⏳ Not Started | —    | —     | —     |

---

### 🏗️ Phase 6 — Infrastructure Alchemist `[0/9]` `~6 weeks`

| #   | Chapter                             | Status         | Done | Score | Notes |
| --- | ----------------------------------- | -------------- | ---- | ----- | ----- |
| 6.1 | 🌍 Terraform Mastery                | ⏳ Not Started | —    | —     | —     |
| 6.2 | 🔧 Terraform Advanced Patterns      | ⏳ Not Started | —    | —     | —     |
| 6.3 | 🏭 Terraform at Scale (MAANG-style) | ⏳ Not Started | —    | —     | —     |
| 6.4 | 📖 GitOps Philosophy                | ⏳ Not Started | —    | —     | —     |
| 6.5 | 🐙 ArgoCD Deep Dive                 | ⏳ Not Started | —    | —     | —     |
| 6.6 | 🌊 FluxCD Deep Dive                 | ⏳ Not Started | —    | —     | —     |
| 6.7 | 🎭 Ansible for SRE/Platform         | ⏳ Not Started | —    | —     | —     |
| 6.8 | 🔒 IaC Security & Policies          | ⏳ Not Started | —    | —     | —     |
| 6.9 | 🌐 GCP-Native IaC                   | ⏳ Not Started | —    | —     | —     |

---

### 🔭 Phase 7 — Observability Oracle `[0/10]` `~5 weeks`

| #    | Chapter                              | Status         | Done | Score | Notes |
| ---- | ------------------------------------ | -------------- | ---- | ----- | ----- |
| 7.1  | 📏 Metrics with Prometheus           | ⏳ Not Started | —    | —     | —     |
| 7.2  | 🔍 PromQL Mastery                    | ⏳ Not Started | —    | —     | —     |
| 7.3  | 📊 Grafana Dashboard Engineering     | ⏳ Not Started | —    | —     | —     |
| 7.4  | 🚨 Alerting That Doesn't Suck        | ⏳ Not Started | —    | —     | —     |
| 7.5  | 📜 ELK Stack                         | ⏳ Not Started | —    | —     | —     |
| 7.6  | 🌊 EFK Stack (Fluentd / Fluent Bit)  | ⏳ Not Started | —    | —     | —     |
| 7.7  | 🔗 Distributed Tracing               | ⏳ Not Started | —    | —     | —     |
| 7.8  | 🌐 OpenTelemetry                     | ⏳ Not Started | —    | —     | —     |
| 7.9  | ☁️ Cloud-Native Observability        | ⏳ Not Started | —    | —     | —     |
| 7.10 | 🔍 Production Incident Investigation | ⏳ Not Started | —    | —     | —     |

---

### 🚀 Phase 8 — CI/CD Champion `[0/9]` `~5 weeks`

| #   | Chapter                               | Status         | Done | Score | Notes |
| --- | ------------------------------------- | -------------- | ---- | ----- | ----- |
| 8.1 | 🔄 CI/CD Philosophy & Pipeline Design | ⏳ Not Started | —    | —     | —     |
| 8.2 | ⚡ GitHub Actions Mastery             | ⏳ Not Started | —    | —     | —     |
| 8.3 | ☁️ Cloud-Native CI/CD                 | ⏳ Not Started | —    | —     | —     |
| 8.4 | 🟦🟩 Blue/Green Deployments           | ⏳ Not Started | —    | —     | —     |
| 8.5 | 🐦 Canary Deployments                 | ⏳ Not Started | —    | —     | —     |
| 8.6 | 🌊 Rolling & Recreate Strategies      | ⏳ Not Started | —    | —     | —     |
| 8.7 | 👻 Shadow & A/B Deployments           | ⏳ Not Started | —    | —     | —     |
| 8.8 | 🔒 Supply Chain Security (SLSA)       | ⏳ Not Started | —    | —     | —     |
| 8.9 | 🧪 Testing in Production Safely       | ⏳ Not Started | —    | —     | —     |

---

### 🥷 Phase 9 — SRE Sensei `[0/11]` `~6 weeks` _(+2 leadership chapters)_

| #    | Chapter                                            | Status         | Done | Score | Notes |
| ---- | -------------------------------------------------- | -------------- | ---- | ----- | ----- |
| 9.1  | 📐 SLIs, SLOs, SLAs — The SRE Trinity              | ⏳ Not Started | —    | —     | —     |
| 9.2  | 💰 Error Budget Management                         | ⏳ Not Started | —    | —     | —     |
| 9.3  | 🔥 Chaos Engineering                               | ⏳ Not Started | —    | —     | —     |
| 9.4  | 📟 On-Call Mastery                                 | ⏳ Not Started | —    | —     | —     |
| 9.5  | 📝 Blameless Post-Mortems                          | ⏳ Not Started | —    | —     | —     |
| 9.6  | 🤖 Toil Reduction Engineering                      | ⏳ Not Started | —    | —     | —     |
| 9.7  | 🛡️ Reliability Patterns                            | ⏳ Not Started | —    | —     | —     |
| 9.8  | 🏥 Capacity Planning                               | ⏳ Not Started | —    | —     | —     |
| 9.9  | 🔐 Production Readiness Reviews                    | ⏳ Not Started | —    | —     | —     |
| 9.10 | 🎖️ **Incident Command & War Room Leadership** `🆕` | ⏳ Not Started | —    | —     | —     |
| 9.11 | 📄 **Architecture Decision Records (ADRs)** `🆕`   | ⏳ Not Started | —    | —     | —     |

> **Ch 9.10 — Incident Command:** Knowing Linux gets you on-call. _Leading_ a Sev-1 War Room gets you to Senior. Roles: Incident Commander (owns the room), Technical Lead (keyboard driver), Comms Lead (stakeholder updates every 15 min). We will simulate full war rooms — who talks, who types, who writes the comms.
>
> **Ch 9.11 — ADRs:** How senior engineers document _why_ a decision was made, what alternatives were considered, and what trade-offs were accepted. "Why GKE over EKS?" A mid-level engineer answers verbally. A senior hands you a peer-reviewed ADR that becomes institutional knowledge. Every MAANG team has an ADR library.

---

### 🤖 Phase 10 — MLOps + LLMOps Master `[0/14]` `~7 weeks` _(+4 LLMOps chapters)_

| #     | Chapter                                                  | Status         | Done | Score | Notes |
| ----- | -------------------------------------------------------- | -------------- | ---- | ----- | ----- |
| 10.1  | 🧭 MLOps Landscape & Maturity                            | ⏳ Not Started | —    | —     | —     |
| 10.2  | 🏭 ML Pipelines                                          | ⏳ Not Started | —    | —     | —     |
| 10.3  | 📊 Experiment Tracking                                   | ⏳ Not Started | —    | —     | —     |
| 10.4  | 🗄️ Feature Stores                                        | ⏳ Not Started | —    | —     | —     |
| 10.5  | 📦 Model Registry & Versioning                           | ⏳ Not Started | —    | —     | —     |
| 10.6  | ⚡ Model Serving at Scale                                | ⏳ Not Started | —    | —     | —     |
| 10.7  | 📈 ML Model Monitoring                                   | ⏳ Not Started | —    | —     | —     |
| 10.8  | 🔄 Continuous Training (CT)                              | ⏳ Not Started | —    | —     | —     |
| 10.9  | 🏗️ LLM Deployment & Serving Basics                       | ⏳ Not Started | —    | —     | —     |
| 10.10 | 💰 GPU & Cost Optimization for ML                        | ⏳ Not Started | —    | —     | —     |
| 10.11 | 🔍 **RAG Architecture & Vector Databases** `🆕`          | ⏳ Not Started | —    | —     | —     |
| 10.12 | 🧪 **LLM Observability & Hallucination Monitoring** `🆕` | ⏳ Not Started | —    | —     | —     |
| 10.13 | 🔀 **Prompt Engineering, Versioning & A/B Testing** `🆕` | ⏳ Not Started | —    | —     | —     |
| 10.14 | ⚡ **Inference Optimization: vLLM, TensorRT, TGI** `🆕`  | ⏳ Not Started | —    | —     | —     |

> **Ch 10.11 — RAG + Vector DBs:** Deploy Pinecone, Milvus, Qdrant, pgvector on K8s. Monitor embedding freshness, chunk quality, retrieval accuracy. RAG is in every AI product being built today.
>
> **Ch 10.12 — LLM Observability:** LLMs hallucinate. How do you _measure_ and _alert_ on hallucination rate? LangSmith, Arize, Whylogs — the new Prometheus for AI systems.
>
> **Ch 10.13 — Prompt Versioning:** Prompts are code. They need version control, A/B testing, rollback — just like application deployments. A genuinely new discipline almost nobody has systematized yet.
>
> **Ch 10.14 — Inference Optimization:** vLLM's PagedAttention, TensorRT quantization, TGI — the difference between a $50K/month GPU bill and a $12K/month bill for the same workload. The #1 cost differentiator for AI Platform engineers right now.

---

### 🏆 Phase 11 — MAANG Interview Domination `[0/5]` `~4 weeks`

| #    | Chapter                         | Status         | Done | Score | Notes |
| ---- | ------------------------------- | -------------- | ---- | ----- | ----- |
| 11.1 | 🏗️ System Design at Scale       | ⏳ Not Started | —    | —     | —     |
| 11.2 | 🔥 Live Incident Simulations    | ⏳ Not Started | —    | —     | —     |
| 11.3 | ⭐ STAR Behavioral Mastery      | ⏳ Not Started | —    | —     | —     |
| 11.4 | 🎯 Role-Specific Deep Dives     | ⏳ Not Started | —    | —     | —     |
| 11.5 | 💬 Negotiation & Offer Strategy | ⏳ Not Started | —    | —     | —     |

---

### 🌊 Phase 12 — Data Engineering & Streaming _(ENTIRELY NEW)_ `[0/13]` `~6 weeks`

> _"At FAANG, the data pipeline is often the most critical infrastructure. Senior Platform engineers deal with data infra that supports the entire business."_ — Senior Engineer (ex-Google + ex-AWS)

| #     | Chapter                                                     | Status         | Done | Score | Notes |
| ----- | ----------------------------------------------------------- | -------------- | ---- | ----- | ----- |
| 12.1  | 🗺️ **Data Engineering Landscape for Platform/SRE** `🆕`     | ⏳ Not Started | —    | —     | —     |
| 12.2  | 📨 **Kafka Architecture Deep Dive** `🆕`                    | ⏳ Not Started | —    | —     | —     |
| 12.3  | ⚙️ **Kafka Operations & Production Tuning** `🆕`            | ⏳ Not Started | —    | —     | —     |
| 12.4  | 🔄 **Stream Processing: Flink & Kafka Streams** `🆕`        | ⏳ Not Started | —    | —     | —     |
| 12.5  | ☁️ **Managed Streaming: Pub/Sub vs MSK vs Event Hubs** `🆕` | ⏳ Not Started | —    | —     | —     |
| 12.6  | 🔍 **Kafka Observability & Incident Patterns** `🆕`         | ⏳ Not Started | —    | —     | —     |
| 12.7  | 🏗️ **Data Pipeline Architecture Patterns** `🆕`             | ⏳ Not Started | —    | —     | —     |
| 12.8  | 🔒 **Data Security, Compliance & Governance** `🆕`          | ⏳ Not Started | —    | —     | —     |
| 12.9  | 🧠 **PostgreSQL Internals Deep Dive** `🆕`                  | ⏳ Not Started | —    | —     | —     |
| 12.10 | 📝 **WAL, MVCC & Transaction Internals** `🆕`               | ⏳ Not Started | —    | —     | —     |
| 12.11 | 📊 **Indexing Strategies: B-tree, Hash, GIN, BRIN** `🆕`    | ⏳ Not Started | —    | —     | —     |
| 12.12 | 🔄 **Replication, HA & Read Replicas** `🆕`                 | ⏳ Not Started | —    | —     | —     |
| 12.13 | 🐌 **Query Performance & Slow Query Diagnosis** `🆕`        | ⏳ Not Started | —    | —     | —     |

> **Kafka (Ch 12.1–12.8):** Kafka is the nervous system of most FAANG-scale applications. Every user action generates events flowing to analytics, ML pipelines, monitoring, and billing. Senior Platform engineers must understand brokers, partitions, replication factor, ISR, consumer group rebalancing, exactly-once semantics (EOS), and how to operate Kafka at scale.
>
> **DB Internals (Ch 12.9–12.13):** You don't need to be a DBA — but Senior Platform interviews ask: _"Why is this query slow? How do you architect for high write throughput? What is MVCC and why does it matter?"_ Understanding the engine makes you dangerous in architectural discussions and invaluable during database-related production incidents.

---

## 🚀 Portfolio Projects

| #   | Project                                  | Difficulty           | GCP | AWS | Azure | GitHub |
| --- | ---------------------------------------- | -------------------- | --- | --- | ----- | ------ |
| P01 | 🏠 Linux SRE Home Lab                    | ⭐ Beginner          | ⏳  | ⏳  | ⏳    | —      |
| P02 | ☸️ Production-Grade K8s Platform         | ⭐⭐ Intermediate    | ⏳  | ⏳  | ⏳    | —      |
| P03 | 🏗️ Multi-Cloud IaC Factory (Terraform)   | ⭐⭐ Intermediate    | ⏳  | ⏳  | ⏳    | —      |
| P04 | 📊 Enterprise Observability Platform     | ⭐⭐⭐ Advanced      | ⏳  | ⏳  | ⏳    | —      |
| P05 | 🚀 Zero-Downtime Deployment Engine       | ⭐⭐⭐ Advanced      | ⏳  | ⏳  | ⏳    | —      |
| P06 | 🛡️ SRE Reliability Lab (Chaos + SLOs)    | ⭐⭐⭐ Advanced      | ⏳  | ⏳  | ⏳    | —      |
| P07 | 🎮 Self-Healing Microservices Platform   | ⭐⭐⭐⭐ Expert      | ⏳  | ⏳  | ⏳    | —      |
| P08 | 🤖 End-to-End MLOps + LLMOps (Vertex AI) | ⭐⭐⭐⭐ Expert      | ⏳  | ⏳  | ⏳    | —      |
| P09 | 💰 FinOps & Cloud Cost Intelligence      | ⭐⭐⭐⭐ Expert      | ⏳  | ⏳  | ⏳    | —      |
| P10 | 🌟 CAPSTONE: Platform Engineering IDP    | ⭐⭐⭐⭐⭐ Legendary | ⏳  | ⏳  | ⏳    | —      |

---

## ⭐ XP & Achievements

| Milestone                                  | XP             | Status    |
| ------------------------------------------ | -------------- | --------- |
| First Chapter Done (Ch 1.1)                | 150            | ✅ Earned |
| Phase 1 Complete                           | 1,500          | ⏳        |
| Phase 3 Complete (eBPF + SPIFFE unlocked!) | 1,350          | ⏳        |
| Phase 4 Complete (GPU + K8s mastered!)     | 1,950          | ⏳        |
| Led First Mock War Room (Ch 9.10)          | 750            | ⏳        |
| Wrote First ADR (Ch 9.11)                  | 500            | ⏳        |
| Phase 10 Complete (LLMOps + RAG!)          | 2,100          | ⏳        |
| Phase 12 Complete (Kafka + DB Internals!)  | 1,950          | ⏳        |
| 50 Days Streak 🔥                          | 1,000          | ⏳        |
| All 10 Projects Shipped                    | 5,000          | ⏳        |
| Full Journey Complete — Interview Ready    | 2,000          | ⏳        |
| **GRAND TOTAL**                            | **~22,000 XP** | ⏳        |

**Current XP: `150` / `~22,000`**

---

## 📅 Study Log

| Date       | Phase | Chapter / Activity          | Time   | Key Learning                                                                                             |
| ---------- | ----- | --------------------------- | ------ | -------------------------------------------------------------------------------------------------------- |
| 2026-03-21 | 1     | Ch 1.1 — Linux Universe Map | 90 min | Kernel = engine, distro = whole car. GCP/AWS/Azure all Linux inside. Created first GCP VM with `gcloud`. |
| —          | —     | —                           | —      | —                                                                                                        |

> I update this every single day I study. Even 20 minutes counts. Consistency beats intensity.

---

## 🧠 MAANG Mindset Principles I'm Internalizing

- [x] **Observability-First** — "If it's not monitored, it doesn't exist in production"
- [ ] **Trade-off Thinking** — No best solution, only best for _this_ context
- [ ] **You Build It, You Run It** — Own your services in production
- [ ] **Toil Elimination** — If manual > twice, automate it
- [ ] **Cost-Optimization Mindset** — Every resource has a justifiable dollar value
- [ ] **Blameless Culture** — Attack the process, never the person
- [ ] **SLO-Driven Decisions** — "Is this worth burning the error budget?"
- [ ] **Security as Code** — Guardrail throughout, not gate at the end
- [ ] **ADR Thinking** _(new)_ — Document _why_, not just _what_ `🆕`
- [ ] **Incident Commander Mindset** _(new)_ — Lead the room, own the comms `🆕`

---

## 🛠️ Full Tech Stack Being Mastered

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=flat-square&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=flat-square&logo=argo&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Elasticsearch](https://img.shields.io/badge/ELK%20Stack-005571?style=flat-square&logo=elasticsearch&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white)
![Kafka](https://img.shields.io/badge/Apache%20Kafka-231F20?style=flat-square&logo=apachekafka&logoColor=white)
![eBPF](https://img.shields.io/badge/eBPF%20%2F%20Cilium-F8C517?style=flat-square&logo=linux&logoColor=black)
![SPIFFE](https://img.shields.io/badge/SPIFFE%2FSPIRE-0D597F?style=flat-square&logo=cncf&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-4285F4?style=flat-square&logo=googlecloud&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat-square&logo=amazonaws&logoColor=black)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=flat-square&logo=microsoftazure&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-466BB0?style=flat-square&logo=istio&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?style=flat-square&logo=helm&logoColor=white)
![vLLM](https://img.shields.io/badge/vLLM%20%2F%20TensorRT-C77DFF?style=flat-square&logo=nvidia&logoColor=white)
![Vector DB](https://img.shields.io/badge/VectorDB-Milvus%2FPinecone-00D4AA?style=flat-square)

</div>

---

## 📬 My Commit Convention

```bash
# After every chapter:
git commit -m "✅ Ch 1.2 done — The Filesystem Kingdom"

# After a project milestone:
git commit -m "🚀 P02 — GKE cluster + ArgoCD + mTLS deployed"

# After completing a phase:
git commit -m "🏆 Phase 1 complete — Linux Roots — 2/12 phases done"

# After adding an ADR (Ch 9.11):
git commit -m "📄 ADR-001 — Why we chose GKE over EKS for this workload"
```

> My commit history is my proof of work. Every green square is a day I showed up. 💪

---

<div align="center">

_Started: March 2026 · Target: August 2027_

_Curriculum designed by a 25-year MAANG veteran · Hardened by Senior Engineer (ex-Google + ex-AWS)_

**"You don't rise to the level of your goals. You fall to the level of your systems."** — James Clear

</div>
