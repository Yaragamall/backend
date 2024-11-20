
# Library Management System Project

## Table of Contents
1. [Overview]
2. [Features]
3. [Setup and Installation]
4. [Database Design and Optimization]
5. [API Development]
6. [Python Scripting]
7. [Usage]
8. [Contributing]

---

## Overview
This project is a comprehensive Library Management System that includes database design, API development, and Python scripting for data manipulation and reporting. It is designed to efficiently manage users, books, and borrowing events while providing APIs for user interaction and administrative tasks.

---

## Features
- PostgreSQL schema with inheritance and indexes for optimized queries.
- REST API using Spring Boot for user and book management.
- Python script for generating sample data and exporting reports.
- Validations to ensure secure and accurate operations.

---

## Setup and Installation

### Prerequisites
1. PostgreSQL installed and configured.
2. Java Development Kit (JDK) 17+.
3. Spring Boot CLI or IDE for running the API.
4. Python 3.8+ with necessary libraries (`pg8000`, `csv`).

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Yaragamall/backend.git
   cd backend 
   ```
2. Configure the PostgreSQL database:
   - Create a database named `libraryManagementsystem`.
   - Run the SQL schema script in `postgreSQLtask/postgreSQLtask.sql` to set up tables.
3. Configure the API:
   - Update `application.properties` in the Spring Boot project with your database credentials.
   - Build and run the API using Maven:
     ```bash
     mvn spring-boot:run
     ```
4. Configure the Python script:
   - Update database connection settings in `PythonBackEndTask/PythonBackEndTask.py`.
   - Install required libraries:
     ```bash
     pip install pg8000 csv
     ```

---

## Database Design and Optimization
### Schema Overview
- **users Table**: `id, name, email, role (Admin/Patron)`
- **books Table**: `id, title, author, isbn, copies_available`
- **borrowing_history Table**: `id, user_id, book_id, borrow_date, return_date`
- **staff Table** (inherits from `Users`): `position, salary`

### Optimizations
- Indexes added for:
  - `title` and `author` columns in `books` for quick search.
  - `user_id` in `borrowing_history` for fetching user history efficiently.

---

## API Development
### Endpoints
1. **POST /users**: Create a new user (Admin/Patron).
2. **GET /books**: Search for books by `title` or `author`.
3. **POST /borrow**: Record a borrowing event.
4. **GET /borrow/history/{userId}**: Retrieve a user's borrowing history.

### Validations
- Admin-only access for adding books.
- Prevent borrowing if `copies_available = 0`.
- Ensure required fields are provided in all requests.

---

## Python Scripting
### Script Features
1. Generate sample data:
   - Populate the database with 100 books, 50 users, and random borrowing events.
2. Export report:
   - Identify books not borrowed in the last 6 months.
   - Export these books to `PythonBackEndTask/unborrowed_books.csv`.

### Running the Script
Run the script from the `PythonBackEndTask` directory:
```bash
python PythonBackEndTask.py
```

---

## Usage
1. Start the PostgreSQL database.
2. Run the Spring Boot API.
3. Interact with the API using tools like Postman or curl.
4. Use the Python script to populate data or export reports.

---

## Contributing
Contributions are welcome! Please fork the repository and create a pull request for review.

---
