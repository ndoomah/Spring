CREATE TABLE users ( username VARCHAR (45) NOT NULL, password VARCHAR (45) NOT NULL, enabled BOOLEAN NOT NULL DEFAULT false, PRIMARY KEY(username));

CREATE TABLE user_roles(
    user_role_id INT NOT NULL, username varchar(45) NOT NULL , role VARCHAR(45) NOT NULL , PRIMARY KEY (user_role_id), foreign key (username) REFERENCES users(username));

DROP TABLE users;

INSERT INTO users(username,password,enabled)
VALUES ('admin','123', true);
INSERT INTO users(username,password,enabled)
VALUES ('alex','123456', true);

INSERT INTO user_roles (username, role)
VALUES ( 'mkyong', 'ROLE_USER');


INSERT INTO user_roles
VALUES (3,'admin', 'ROLE_ADMIN');
INSERT INTO user_roles
VALUES (2,'alex', 'ROLE_USER');
