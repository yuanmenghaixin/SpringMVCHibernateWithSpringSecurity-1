--MySQl DBA
-----------


/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);
   
/* USER_PROFILE table contains all possible roles */ 
create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
   
/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
  
/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
  
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
  
INSERT INTO USER_PROFILE(type)
VALUES ('DBA');
  
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email)
VALUES ('sam','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam','Smith','samy@xyz.com');
  
  
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.sso_id='sam' and profile.type='ADMIN';
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);


--Oracle Database
--------------

CREATE TABLE app_user (
  id NUMBER(19) NOT NULL,
  sso_id VARCHAR2(30) NOT NULL,
  password VARCHAR2(100) NOT NULL,
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30) NOT NULL,
  email VARCHAR2(30) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE app_user_user_profile (
  user_id NUMBER(19) NOT NULL,
  user_profile_id NUMBER(19) NOT NULL,
  PRIMARY KEY (user_id,user_profile_id)
);
CREATE TABLE persistent_logins (
  username VARCHAR2(64) NOT NULL,
  series VARCHAR2(64) NOT NULL,
  token VARCHAR2(64) NOT NULL,
  last_used TIMESTAMP NOT NULL,
  PRIMARY KEY (series)
);
CREATE TABLE user_profile (
  id NUMBER(19) NOT NULL,
  type VARCHAR2(30) NOT NULL,
  PRIMARY KEY (id)
);
ALTER TABLE app_user_user_profile
  ADD FOREIGN KEY (user_profile_id) 
  REFERENCES user_profile (id);

ALTER TABLE app_user_user_profile
  ADD FOREIGN KEY (user_id) 
  REFERENCES app_user (id);


INSERT INTO app_user(id, sso_id, password, first_name, last_name, email) VALUES (1, 'sam', '$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam', 'Smith', 'samy@xyz.com');
INSERT INTO app_user(id, sso_id, password, first_name, last_name, email) VALUES (2, 'C4231', '$2a$10$H02DlaaMaKAYwApta2EMnunq/36/KBmDdWKO7mSwtsRpXeY5rSuX6', 'Veera', 'Sareddy', 'veera.sareddy@gmail.com');
INSERT INTO app_user_user_profile(user_id, user_profile_id) VALUES (1, 2);
INSERT INTO app_user_user_profile(user_id, user_profile_id) VALUES (2, 2);
INSERT INTO user_profile(id, type) VALUES (2, 'ADMIN');
INSERT INTO user_profile(id, type) VALUES (3, 'DBA');
INSERT INTO user_profile(id, type) VALUES (1, 'USER');
