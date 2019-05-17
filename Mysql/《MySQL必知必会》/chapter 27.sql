# [字符集与语言]
show character set ;
show collation ;

show variables like 'character%';
show variables like 'collation%';

create table mytable(
    column1 int,
    column2 varchar(10),
    column3 varchar(10)
        character set latin1
        collate latin1_general_ci
)default character set hebrew
collate hebrew_general_ci;

select *from customers
    order by lastname,firstname
        collate latin1_general_cs;