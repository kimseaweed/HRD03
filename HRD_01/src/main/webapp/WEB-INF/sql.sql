CREATE table member_tbl_02(
    custno number(6) primary key,
    custname varchar(20),
    phone varchar(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)    
);
drop sequence tbl_02;
create sequence tbl_02 start with 100001;
alter table member_tbl_02 modify (custno default tbl_02.nextval primary key);
desc member_tbl_02;
insert into member_tbl_02 values( tbl_02.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01' );
insert into member_tbl_02 values( tbl_02.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01' );
insert into member_tbl_02 values( tbl_02.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30' );
insert into member_tbl_02 values( tbl_02.nextval, '최사항', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30' );
insert into member_tbl_02 values( tbl_02.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60' );
insert into member_tbl_02 values( tbl_02.nextval, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60' );
select * from member_tbl_02;
truncate table member_tbl_02;
------------
drop SEQUENCE salenol;
create SEQUENCE salenol start with 20160001;
create table money_tbl_02(
    custno number(6),
    salenol number(8) default salenol.nextval,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    primary key (custno, salenol)
);

insert into money_tbl_02 values ( '100001',salenol.nextval, 500, 5, 2500, 'A001', TO_DATE(20160101) );
insert into money_tbl_02 values ( '100001',salenol.nextval, 1000, 4, 4000, 'A002',TO_DATE( 20160101) );
insert into money_tbl_02 values ( '100001',salenol.nextval, 500, 3, 1500, 'A008', TO_DATE(20160101) );

insert into money_tbl_02 values ( '100002',salenol.nextval, 2000, 1, 2000, 'A004', TO_DATE(20160102) );
insert into money_tbl_02 values ( '100002',salenol.nextval, 500, 5, 500, 'A001', TO_DATE(20160103) );

insert into money_tbl_02 values ( '100003',salenol.nextval, 1500, 2, 3000, 'A003', TO_DATE(20160103) );

insert into money_tbl_02 values ( '100004',salenol.nextval, 500, 2, 1000, 'A001', TO_DATE(20160104) );
insert into money_tbl_02 values ( '100004',salenol.nextval, 300, 1, 300, 'A005', TO_DATE(20160104) );
insert into money_tbl_02 values ( '100004',salenol.nextval, 600, 1, 600, 'A006', TO_DATE(20160104) );
insert into money_tbl_02 values ( '100004',salenol.nextval, 3000, 1, 3000, 'A007', TO_DATE(20160106) );

select * from  money_tbl_02;