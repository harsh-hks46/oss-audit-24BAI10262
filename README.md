# 🧾 Open Source Audit Project – Python

## 👤 Student Details

* **Name:** Harsh Kumar Singh
* **Roll Number:** 24BAI10262
* **Software Audited:** Python

---

## 📌 Project Overview

This project presents a comprehensive audit of **Python** as an open-source software. It explores its history, licensing, ecosystem, and compares it with proprietary alternatives.

Additionally, the project includes practical Linux-based shell scripts that demonstrate key system concepts and automation techniques.

---

## 🎯 Objectives

* Understand the fundamentals of open-source software
* Analyze Python’s origin, evolution, and governance
* Study Python’s licensing model
* Compare open-source vs proprietary software
* Demonstrate Linux scripting concepts through real use cases

---

## 🐍 About Python

Python is a high-level, interpreted programming language known for its simplicity and readability. It is widely used in:

* Web Development
* Data Science & Machine Learning
* Automation & Scripting
* Software Development

---

## ⚙️ Key Features of Python (Audit Highlights)

* Open-source and community-driven
* Cross-platform compatibility
* Extensive standard library
* Large ecosystem of third-party packages
* Strong community support

---

## 📜 License

Python is released under the **Python Software Foundation License (PSFL)**, which is:

* Open-source
* GPL-compatible
* Permissive and flexible

---

## 🔄 Open Source vs Proprietary Software

| Feature            | Open Source (Python) | Proprietary Software |
| ------------------ | -------------------- | -------------------- |
| Source Code Access | Available            | Restricted           |
| Cost               | Free                 | Paid                 |
| Customization      | High                 | Limited              |
| Community Support  | Strong               | Vendor-based         |
| Transparency       | High                 | Low                  |

---

## 🖥️ Shell Scripts Included

### 1️⃣ System Identity Report

Displays:

* Kernel version
* Current user
* System uptime
* OS details

---

### 2️⃣ FOSS Package Inspector

* Checks if Python is installed
* Displays version and system details

---

### 3️⃣ Disk and Permission Auditor

* Shows directory permissions
* Displays disk usage statistics

---

### 4️⃣ Log File Analyzer

* Analyzes log files
* Counts occurrences of a given keyword

---

### 5️⃣ Open Source Manifesto Generator

* Generates a custom open-source philosophy statement
* Encourages awareness of FOSS principles

---

## 🚀 How to Run the Scripts

### Step 1: Give execute permission

```bash
chmod +x *.sh
```

### Step 2: Run scripts

```bash
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_auditor.sh
./script4_log_analyzer.sh /var/log/dpkg.log
./script5_manifesto.sh
```

---

## 🖥️ Detailed Script Documentation

---

### 🔹 Script 1: System Identity Report (`script1_system_identity.sh`)

**Description:**
This script displays basic information about the Linux system. It shows the kernel version, current user, system uptime, date/time, and Linux distribution. It acts like a welcome screen for the system.

**Steps to Run:**

```bash
chmod +x script1_system_identity.sh
./script1_system_identity.sh
```

**Dependencies:**

* Bash shell
* Commands used: `uname`, `whoami`, `uptime`, `date`, `lsb_release`

---

### 🔹 Script 2: FOSS Package Inspector (`script2_package_inspector.sh`)

**Description:**
This script checks whether Python is installed on the system. If installed, it displays the version of Python and prints a short description using a case statement.

**Steps to Run:**

```bash
chmod +x script2_package_inspector.sh
./script2_package_inspector.sh
```

**Dependencies:**

* Bash shell
* Python installed (`python3`)
* Commands used: `dpkg`, `grep`, `python3`

---

### 🔹 Script 3: Disk and Permission Auditor (`script3_disk_auditor.sh`)

**Description:**
This script scans important system directories and displays their permissions, owner, and disk usage. It helps understand how Linux manages files and storage.

**Steps to Run:**

```bash
chmod +x script3_disk_auditor.sh
./script3_disk_auditor.sh
```

**Dependencies:**

* Bash shell
* Commands used: `ls`, `du`, `awk`, `cut`

---

### 🔹 Script 4: Log File Analyzer (`script4_log_analyzer.sh`)

**Description:**
This script analyzes a log file and counts how many times a specific keyword (default: "error") appears. It also shows the last few matching lines.

**Steps to Run:**

```bash
chmod +x script4_log_analyzer.sh
./script4_log_analyzer.sh/var/log/dpkg.log
```

**Dependencies:**

* Bash shell
* Access to log files
* Commands used: `grep`, `tail`

---

### 🔹 Script 5: Open Source Manifesto Generator (`script5_manifesto.sh`)

**Description:**
This script interacts with the user by asking questions and generates a personalized open-source philosophy statement. The output is saved to a text file.

**Steps to Run:**

```bash
chmod +x script5_manifesto.sh
./script5_manifesto.sh
```

**Dependencies:**

* Bash shell
* Commands used: `read`, `date`, `echo`, `cat`

---

## 📂 Project Structure

```
Open-Source-Audit-Python/
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
├── script5_manifesto.sh
├── README.md
```

---

## 💡 Learning Outcomes

* Gained practical knowledge of Linux shell scripting
* Understood open-source licensing and governance
* Explored real-world use of Python ecosystem
* Learned differences between open and closed software models

---

## 🤝 Contribution

This project is created for academic purposes.
Contributions, suggestions, and improvements are welcome!

---

## ⭐ Acknowledgment

Thanks to the open-source community for providing powerful tools like Python and Linux that make learning and development accessible to everyone.
