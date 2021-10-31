create table users (
    id          int PRIMARY KEY AUTO_INCREMENT,
    pw          varchar(20) NOT NULL,
    username    varchar(10) NOT NULL,
    `profile-image`   varchar(100) NOT NULL,
    `profile-message` varchar(100) NOT NULL,
    isquit        tinyint(1)  NOT NULL DEFAULT 0,
    `singin-date`   date NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table channels (
    id          int PRIMARY KEY AUTO_INCREMENT,
    name        varchar(20) NOT NULL,
    `user-id`   int NOT NULL,
    link        varchar(100) NOT NULL,
    capacity    int NOT NULL,
    isquit        tinyint(1)  NOT NULL DEFAULT 0,
    `singin-date`   date NOT NULL,
    FOREIGN KEY(`user-id`) references users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table chats (
    id      int PRIMARY KEY AUTO_INCREMENT,
    content varchar(100) NOT NULL,
    writer  int NOT NULL, 
    channel int NOT NULL,
    `chat-date`     date NOT NULL,
    FOREIGN KEY(writer) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(channel) REFERENCES channels(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table follows (
    id      int PRIMARY KEY AUTO_INCREMENT,
    follower    int NOT NULL,
    followee    int NOT NULL,
    `follow-date`   date NOT NULL,
    FOREIGN KEY(follower) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(followee) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table blocks (
    id      int PRIMARY KEY AUTO_INCREMENT,
    blocking    int NOT NULL,
    blocked     int NOT NULL,
    `block-date`    date NOT NULL,
    FOREIGN KEY(blocking) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(blocked) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

