-- INSTAGRAM CLONE DATABASE
---------------------------

-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS ig_clone DEFAULT CHARACTER SET utf8;

USE ig_clone;

-- CREATE TABLES
--- USERS TABLE
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

--- PHOTOS TABLE
CREATE TABLE IF NOT EXISTS photos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
    ON DELETE CASCADE
);

--- COMMENTS TABLE
CREATE TABLE IF NOT EXISTS comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text TEXT NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  FOREIGN KEY(photo_id) REFERENCES photos(id)
    ON DELETE CASCADE
);

--- LIKES TABLE
CREATE TABLE IF NOT EXISTS likes (
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  FOREIGN KEY(photo_id) REFERENCES photos(id)
    ON DELETE CASCADE,
  PRIMARY KEY(user_id, photo_id)
);

--- FOLLOWS TABLE
CREATE TABLE IF NOT EXISTS follows (
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id)
    ON DELETE CASCADE,
  FOREIGN KEY (followee_id) REFERENCES users(id)
    ON DELETE CASCADE,
  PRIMARY KEY(follower_id, followee_id)
);

--- TAGS TABLE
CREATE TABLE IF NOT EXISTS tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

--- PHOTO_TAGS TABLE
CREATE TABLE IF NOT EXISTS photo_tags (
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags(id)
    ON DELETE CASCADE,
  PRIMARY KEY(photo_id, tag_id)
);