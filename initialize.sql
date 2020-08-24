CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE usersContact (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  phone1 VARCHAR(50),
  phone2 VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE usersAddress (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  county VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE usersCredentials (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(25),
  password VARCHAR(100),
  PRIMARY KEY (id),
  UNIQUE KEY (username)
);

CREATE TABLE usersContacts (
  contact_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone1 VARCHAR(50),
  phone2 VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(100),
  city VARCHAR(50),
  county VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  company_name VARCHAR(50),
  PRIMARY KEY (contact_id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE usersAppointment (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  contacts_id INT NOT NULL,
  app_day INT NOT NULL,
  app_month INT NOT NULL,
  app_year INT NOT NULL,
  start_at TIME,
  end_at TIME,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id),
  FOREIGN KEY (contacts_id)
  REFERENCES usersContacts (contact_id)
    ON DELETE CASCADE  
);

