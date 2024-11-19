CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(10) CHECK (role IN ('Admin', 'Patron')) NOT NULL
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    copies_available INT CHECK (copies_available >= 0) NOT NULL
);

CREATE TABLE borrowing_history (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(id) ON DELETE CASCADE,
    book_id INT NOT NULL REFERENCES Books(id) ON DELETE CASCADE,
    borrow_date DATE NOT NULL,
    return_date DATE
);

CREATE TABLE staff (
    position VARCHAR(50) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL
) INHERITS (Users);

CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_books_author ON books(author);

CREATE INDEX idx_borrowing_history_user ON borrowinghistory(user_id);