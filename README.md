# 🏢 Employee Management Dashboard

A full-stack, Model-View-Controller (MVC) Java web application for managing company employee records. This project demonstrates core backend Java principles, database integration, and responsive frontend design without relying on heavy frameworks like Spring Boot.

## ✨ Features
* **Read:** View a complete, real-time roster of employees.
* **Create:** Add new employees to the database via a responsive HTML form.
* **Delete:** Securely remove employee records with a single click (includes safety confirmation prompts).
* **Cloud Database Integration:** Fully configured to read/write to a live cloud MySQL database.
* **Modern UI:** Styled using Tailwind CSS for a clean, responsive, and professional interface.

## 🛠️ Tech Stack
* **Frontend:** HTML5, Tailwind CSS (CDN), JSP (JavaServer Pages), JSTL (Standard Tag Library)
* **Backend:** Java 17, Java Servlets (Jakarta EE)
* **Database:** MySQL (Hosted on Aiven Cloud)
* **Architecture:** MVC (Model-View-Controller)
* **Server:** Apache Tomcat 10+
* **IDE:** Eclipse (Dynamic Web Project)

## 📁 Project Structure
```text
src/
├── main/java/com/company/
│   ├── controller/
│   │   └── EmployeeServlet.java    # Handles GET/POST requests and JDBC logic
│   └── model/
│       └── Employee.java           # Java object representing a database row
│
└── main/webapp/
    ├── employees.jsp               # The View (UI rendered with Tailwind & JSTL)
    └── WEB-INF/
        └── lib/                    # Required JAR files (MySQL driver, JSTL)# 🏢 Employee Management Dashboard

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)

A full-stack, Model-View-Controller (MVC) Java web application for managing company employee records. This project demonstrates core backend Java principles, database integration, and responsive frontend design without relying on heavy frameworks.

## 📑 Table of Contents
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Database Setup](#database-setup)
  - [Installation](#installation)
- [Project Structure](#-project-structure)
- [What I Learned](#-what-i-learned)

## ✨ Features
* **Read:** View a complete, real-time roster of employees.
* **Create:** Add new employees to the database via a responsive HTML form.
* **Delete:** Securely remove employee records with a single click (includes safety confirmation prompts).
* **Cloud Database Integration:** Fully configured to read/write to a live cloud MySQL database (Aiven).
* **Modern UI:** Styled using Tailwind CSS for a clean, responsive, and professional interface.

## 🛠️ Tech Stack
* **Frontend:** HTML5, Tailwind CSS (CDN), JSP (JavaServer Pages), JSTL (Standard Tag Library)
* **Backend:** Java 17, Java Servlets (Jakarta EE)
* **Database:** MySQL (Hosted on Aiven Cloud)
* **Architecture:** MVC (Model-View-Controller)
* **Server:** Apache Tomcat 10+
* **IDE:** Eclipse (Dynamic Web Project)

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
To run this project locally, you will need to have the following installed:
* **[Java Development Kit (JDK) 17+](https://adoptium.net/)**
* **[Apache Tomcat 10+](https://tomcat.apache.org/)**
* **[Eclipse IDE for Enterprise Java](https://www.eclipse.org/downloads/packages/)**
* **[MySQL Workbench](https://www.mysql.com/products/workbench/)** (Optional, for database management)

### Database Setup
This application requires a MySQL database. You can host this locally or use a free cloud provider like Aiven. 

Execute the following SQL script in your MySQL environment to create the required table:
```sql
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);