-- library management system
create table authors (
  author_id varchar(100),
  author_name varchar(50),
  primary key (author_id)
);

create table books (
  book_id varchar(100),
  genre text,
  title varchar(100),
  author_id varchar(100),
  book_qty int,
  primary key (book_id),
  foreign key (author_id) references authors(author_id)
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

insert into authors values 
  ('a001', 'Vinner'),
  ('a002', 'Gautam'),
  ('a003', 'Dharmesh'),
  ('a004', 'Krishna'),
  ('a005', 'Deepak'),
  ('a006', 'Puneet');
  
insert into books values
  ('b101', 'Fiction','Alice in wonderland', 'a001', 12),
  ('b102', 'Mystery', 'Mind mapping', 'a002', 3),
  ('b103', 'Habits', 'learning habits', 'a003', 6),
  ('b104', 'Self help', '12 rules of power', 'a004', 7),
  ('b105', 'Habits', 'Atomic habits', 'a005', 2),
  ('b106', 'Habits', 'Power of habits', 'a006', 1),
  ('b107', 'Fiction', 'Everybody around you is an idiot', 'a002', 10),
  ('b108', 'Self help','Surrounded by geniuses', 'a005', 3);
  
insert into borrowers values 
  ('b001', 'Aayush', 'b101', '2024-2-12', '2024-2-18'),
  ('b002', 'Aman', 'b101', '2024-3-7', '2024-3-18'),
  ('b003', 'Arman', 'b101', '2024-2-18', '2024-2-25'),
  ('b004', 'Vinayak', 'b101', '2024-1-30', '2024-2-17'),
  ('b005', 'Sahil', 'b101', '2024-2-18', '2024-3-10');

select books.title, authors.author_name
from books
inner join authors 
on books.author_id = authors.author_id
where genre = 'Habits';



select * from books
order by book_qty desc;



-- select * from borrowers;
-- select * from books;
-- select * from authors;


