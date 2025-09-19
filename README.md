# Fooocus Google Colab 🚀

This repository contains a **Google Colab notebook** for running [Fooocus](https://github.com/lllyasviel/Fooocus) — an easy-to-use tool for **AI image enhancement and generation**.

---

## 📌 Features
- Run Fooocus directly in **Google Colab** with GPU support.
- No local setup required.
- Supports **image enhancement, upscaling, and AI image generation**.
- Easy web UI (`--share`) for quick access.

---

## ⚡ Getting Started

### 1. Open in Google Colab
Click the badge below to launch the notebook:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/<your-username>/<your-repo-name>/blob/main/fooocus_colab.ipynb)

### 2. Run the Notebook
The main cell installs dependencies, clones Fooocus, and runs the server:

```bash
!pip install pygit2==1.15.1
%cd /content
!git clone https://github.com/lllyasviel/Fooocus.git
%cd /content/Fooocus
!python entry_with_update.py --share --always-high-vram
