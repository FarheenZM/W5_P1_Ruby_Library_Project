DROP TABLE rentals;
DROP TABLE books;
DROP TABLE customers;

CREATE TABLE books
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  category VARCHAR(255)
);

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  postal_code VARCHAR(10) not null
);

CREATE TABLE rentals
(
  id SERIAL8 primary key,
  book_id INT8 references books(id),
  customer_id INT8 references customers(id)
);
