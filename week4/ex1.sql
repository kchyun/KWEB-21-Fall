create table `student` (
    `name`          varchar(20) NOT NULL,
    `ID`            int PRIMARY KEY AUTO_INCREMENT,
    `year`          int NOT NULL,
    `major`         varchar(20) NOT NULL,
    `phone-num`     int NOT NULL,
    `address`       varchar(50) NOT NULL,
    `total-credit`  int NOT NULL DEFAULT 0,
    `GPA`           numeric(1,1)    NOT NULL,
    `attending`     tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;