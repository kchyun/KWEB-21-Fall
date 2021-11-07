# 1. c1이 11이고 c2가 2인 row의 id, c3, c5 column을 조회
select id, c3, c5 from crud
where c1 = 11 and c2 = 2;

#c1이 18보다 크거나 c2가 2보다 작은 row의 모든 column을 조회
select * from crud
where c1 > 18 or c2 < 2;

# 3. id와 c4는 기본값, c1은 7, c2는 4, c3는 “col101”, c5는 0인 row를 생성
insert into crud(c1, c2, c3, c5)
values (7, 4, "col101", 0);

# 4. id는 103, c1은 3, c2는 3, c3는 “col103”, c4는 기본값, c5는 1인 row를 생성
insert into crud(id, c1, c2, c3, c5)
values (103, 3, 3, "col103", 1);

# 5. id가 100보다 큰 row의 모든 column을 조회
select * from crud
where id > 100;

# 6. c1이 4보다 크고 9보다 작고, c2가 1인 row의 c3를 “col0”, c5를 0으로 수정
update crud set c3 = "col0", c5 = 0
where c1 between 4 and 9;

# 7. c1이 4보다 크고 9보다 작고, c2가 1인 row의 모든 column을 조회
select * from crud
where (c1 between 4 and 9) and c2 = 1;

# 8. c5가 0인 row를 삭제
delete from crud
where c5 = 0;

# 9. c5가 0인 row의 모든 column을 조회
select * from crud
where c5 = 0;
