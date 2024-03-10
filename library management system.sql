-- library management system

create table books (
  book_id varchar(100),
  book_name int,
  author_id varchar(100),
  qty int,
  primary key (book_id),
  foreign key author_id references authors(author_id)
);

create table authors (
  author_id varchar(100),
  author_name varchar(50),
  primary key (author_id)
);

create table borrowers (
  borrower_id varchar(100),
  borrower_name varchar(50),
  borrowed_book_id varchar(100),
  borrowed_date date,
  return_date date,
  primary key (borrower_id),
  foreign key (borrowed_book_id) references books(book_id)
);