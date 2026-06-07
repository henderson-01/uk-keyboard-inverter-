# Contributing to UK Keyboard Inverter

First off, thank you for your interest in this project! This tool is designed to be a simple, lightweight solution for users who prefer inverted symbol/number behavior on UK ISO keyboards.

## 🛑 Project Status: Feature Complete

The core dynamics of this program are currently **complete and stable**. Because I want to ensure this tool remains as simple and reliable as possible, **I am not accepting pull requests or merges into the `main` branch.** The `main` branch will remain in its original, functional state.

However, I absolutely encourage you to play around with the code! You are highly encouraged to fork the project and create your own branches to experiment, tweak, or expand the tool for your own use cases.

## 📜 Code Philosophy

The primary goal of this project is **simplicity and stability**.

* **Functional over Fashionable:** The scripts are written in standard Bash. I prefer readable, functional code over complex abstractions.
* **Minimal Dependencies:** I rely on system-standard tools (`apt`, `sed`, `udevadm`) and the `keyd` utility.
* **Hardware Specific:** This project specifically targets the **Standard UK ISO Layout**.

## 🛠 How to Interact with the Project

### Forking & Experimenting (Highly Encouraged!)

Want to add a feature, support a different keyboard layout, or completely change how the script works?

1. Fork the repository to your own GitHub account.
2. Create a new branch for your custom features.
3. Modify and experiment as much as you like!
4. *(Note: Please do not submit Pull Requests back to this repository's `main` branch, as they will be closed).*

### Reporting Bugs

I am still actively monitoring for critical issues with the original scripts. If something breaks on a standard setup:

* Ensure the bug is reproducible.
* Check if your keyboard is indeed a Standard UK ISO layout.
* Open an issue with details about your OS version (e.g., Ubuntu 22.04) and the specific behavior you are seeing.

## 💻 Coding Standards (For your forks)

If you are forking this project, here are the standards used in the original codebase to help guide your modifications:

* Use `set -euo pipefail` at the start of scripts for robust error handling.
* Use `shellcheck` to verify your scripts for common pitfalls.
* Keep comments clear and helpful for beginners.
* Prefer absolute paths for system configurations.

## ⚠️ Testing Requirement

Because this script modifies hardware input behavior at a system level, be careful when experimenting on your own branches.

**Any modifications you make to the `default.conf` mapping or the system layout settings should be thoroughly tested on a fresh VM or a secondary machine to ensure you do not break password entry or core key functionality.**

---

Thank you for helping keep the UK Keyboard Inverter reliable!
