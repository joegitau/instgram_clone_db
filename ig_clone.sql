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

-------------------------------
-- SAMPLE DATABASE DATA

INSERT INTO users (username, created_at) 
  VALUES 
  ('kajoe14', '2017-02-16 18:22:10.846'), ('Joe_gitau', '2019-04-02 17:11:21.417'), 
  ('Andy_Robo18', '2017-02-21 11:12:32.574'), ('Sadio_Bogan63', '2016-08-13 01:28:43.085'), 
  ('Mo_Salah', '2016-12-07 01:04:39.298'), ('Trevor.Alexander', '2017-04-30 13:26:14.496'), 
  ('Hendo_Homenick', '2016-12-12 06:50:07.996'), ('Virgil_Schamberger11', '2016-08-20 02:19:45.512'), 
  ('Keita_94', '2016-06-24 19:36:30.978'), ('Presley_McClure', '2016-08-07 16:25:48.561'), 
  ('Justina.Gaylord27', '2017-05-04 16:32:15.577'), ('Dereck65', '2017-01-19 01:34:14.296'), 
  ('Alexandro35', '2017-03-29 17:09:02.344'), ('Jaclyn81', '2017-02-06 23:29:16.394'), 
  ('Billy52', '2016-10-05 14:10:20.453'), ('Annalise.McKenzie16', '2016-08-02 21:32:45.646'), 
  ('Norbert_Carroll35', '2017-02-06 22:05:43.425'), ('Odessa2', '2016-10-21 18:16:56.390'), 
  ('Hailee26', '2017-04-29 18:53:39.650'), ('Delpha.Kihn', '2016-08-31 02:42:30.288'), 
  ('Rocio33', '2017-01-23 11:51:15.467'), ('Kenneth64', '2016-12-27 09:48:17.380'), 
  ('Eveline95', '2017-01-23 23:14:18.569'), ('Maxwell.Halvorson', '2017-04-18 02:32:43.597'), 
  ('Tierra.Trantow', '2016-10-03 12:49:20.774'), ('Josianne.Friesen', '2016-06-07 12:47:00.703');

INSERT INTO photos (image_url, user_id) 
  VALUES 
  ('http://elijah.biz', 1), ('https://shanon.org', 1), ('http://vicky.biz', 1), ('http://oleta.net', 1),
   ('https://jennings.biz', 1), ('https://quinn.biz', 2), ('https://selina.name', 2), ('http://malvina.org', 2), 
   ('https://branson.biz', 2), ('https://elenor.name', 3), ('https://marcelino.com', 3), ('http://felicity.name', 3), 
   ('https://fred.com', 3), ('https://gerhard.biz', 4), ('https://sherwood.net', 4), ('https://maudie.org', 4), 
   ('http://annamae.name', 6), ('https://mac.org', 6), ('http://miracle.info', 6), ('http://emmet.com', 6), 
   ('https://lisa.com', 6), ('https://brooklyn.name', 8), ('http://madison.net', 8), ('http://annie.name', 8), ('http://darron.info', 8), 
   ('http://saige.com', 9), ('https://reece.net', 9), ('http://vance.org', 9), ('http://ignacio.net', 9), ('http://kenny.com', 10), 
   ('http://remington.name', 10), ('http://kurtis.info', 10), ('https://alisha.com', 11), ('https://henderson.com', 11), 
   ('http://bonnie.info', 11), ('http://kennith.net', 11), ('http://camille.name', 11), ('http://alena.net', 12), 
   ('http://ralph.name', 12), ('https://tyshawn.com', 12), ('https://adella.net', 12), ('https://cielo.info', 13), 
   ('https://easter.net', 13), ('http://golden.org', 13), ('http://kendall.biz', 13), ('https://glenda.info', 13), 
   ('http://dominic.biz', 15), ('http://tressie.info', 15), ('http://estevan.org', 15), ('http://zena.com', 15), 
   ('https://abagail.com', 16), ('https://hershel.com', 16), ('http://collin.com', 16), ('https://clair.com', 16), 
   ('https://deondre.com', 17), ('http://tristin.name', 17), ('http://kirk.org', 17), ('https://modesta.info', 18), 
   ('http://rylan.biz', 19), ('https://noemie.com', 19), ('https://dejon.name', 20), ('https://rigoberto.net', 22);

INSERT INTO follows (follower_id, followee_id) 
  VALUES 
  (2, 1), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), 
  (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21), (2, 22), (2, 13), (2, 14), (2, 15), (2, 26), (2, 7), (2, 8), (2, 9), 
  (2, 20), (2, 11), (2, 2), (2, 3), (2, 14), (2, 15), (2, 16), (2, 7), (2, 18), (2, 19), (2, 10), (2, 11), (2, 12), (2, 13), 
  (2, 14), (2, 4), (2, 16), (2, 17), (2, 18), (2, 9), (2, 5), (2, 11), (2, 12), (2, 13), (2, 4), (2, 5), (2, 6), (2, 7), 
  (2, 18), (2, 19), (2, 20), (2, 1), (2, 2), (2, 13), (2, 4), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 10), (2, 1), 
  (2, 20), (2, 3), (2, 4), (2, 15), (2, 6), (2, 16), (2, 18), (2, 19), (2, 10), (2, 1), (2, 12), (2, 13), (2, 4), (2, 15);

INSERT INTO comments (comment_text, user_id, photo_id)  
  VALUES 
  ('unde at dolorem', 2, 1), ('quae ea ducimus', 3, 1), ('alias a voluptatum', 5, 1), ('facere suscipit sunt', 14, 1), 
  ('totam eligendi quaerat', 17, 1), ('vitae quia aliquam', 21, 1), ('exercitationem occaecati neque', 22, 1), ('sint ad fugiat', 21, 1), 
  ('nesciunt aut nesciunt', 6, 1), ('laudantium ut nostrum', 11, 1), ('omnis aut asperiores', 12, 1), ('et eum molestias', 4, 1), 
  ('alias pariatur neque', 5, 1), ('amet iure adipisci', 7, 1), ('cum enim repellat', 12, 1), ('provident dolorem non', 3, 1), 
  ('eos consequuntur impedit', 6, 1), ('voluptas nemo blanditiis', 11, 1), ('id fugit dolores', 12, 1), 
  ('occaecati tenetur exercitationem', 15, 1), ('quasi deserunt voluptates', 76, 1), ('reprehenderit sunt cumque', 18, 1), 
  ('non impedit ut', 17, 1), ('voluptatum sit id', 11, 1), ('tenetur voluptas aspernatur', 8, 1), ('in veritatis quia', 3, 2), 
  ('quis facilis ea', 5, 2), ('quia est sit', 14, 2), ('voluptatem doloremque accusamus', 15, 2), ('consectetur inventore quis', 18, 2);

INSERT INTO likes (user_id, photo_id) 
  VALUES 
  (2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (19, 1), (21, 1), (22, 1), (15, 1), (16, 1), (19, 1), (6, 1), (17, 1), (4, 1), 
  (15, 1), (7, 1), (6, 1), (69, 1), (11, 1), (15, 8), (6, 1), (18, 1), (2, 1), (11, 1), (3, 2), (5, 2), (6, 2), (8, 2), (14, 2), 
  (17, 2), (19, 2), (21, 2), (21, 2), (6, 2), (7, 2), (20, 2), (1, 2), (13, 2), (16, 2), (8, 2), (10, 2), (11, 2), (14, 2), (12, 2), 
  (14, 2), (6, 2), (20, 2), (62, 2), (13, 2), (16, 2), (1, 2), (5, 2), (6, 2), (2, 2), (17, 2), (11, 2), (12, 2), (14, 2), (5, 2), 
  (16, 2), (4, 3), (5, 3), (12, 3), (14, 3), (15, 3), (20, 3), (21, 3), (21, 3), (22, 3), (20, 3), (21, 3), (12, 3), (17, 3), (11, 3);

INSERT INTO tags (tag_name) 
  VALUES 
  ('football'), ('liverpool'), ('tottenham'), ('landscape'), ('fc_barcelona'), ('fc_bayern'), ('delicious'), ('beauty'), 
  ('stunning'), ('dreamy'), ('lol'), ('happy'), ('fun'), ('style'), ('hair'), ('fashion'), ('party'), 
  ('concert'), ('drunk'), ('beach'), ('smile');

INSERT INTO photo_tags (photo_id, tag_id) 
  VALUES 
  (1, 18), (1, 17), (1, 21), (1, 13), (1, 19), (2, 4), (2, 3), (2, 20), (2, 2), (3, 8), (4, 12), (4, 11), (4, 21), 
  (4, 13), (5, 15), (5, 14), (5, 17), (5, 16), (6, 19), (6, 13), (6, 17), (6, 21), (7, 11), (7, 12), (7, 21), (7, 13), (8, 17), 
  (8, 21), (8, 13), (8, 19), (9, 18), (10, 2), (11, 12), (11, 21), (11, 11), (12, 4), (13, 13), (13, 19), (14, 1), (14, 20), 
  (17, 19), (17, 13), (17, 18), (19, 5), (21, 20), (21, 3), (21, 1), (21, 4), (22, 7), (22, 5), (22, 6);


-----------------------
-- QUERIES
----------
--- oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- what day of the week does most regirstrations occur
SELECT 
  DAYNAME(created_at) AS weekday,
  COUNT(*) AS users_registered
FROM users
GROUP BY weekday
ORDER BY users_registered DESC;

--- users that are in-active
SELECT 
  username,
  IFNULL(image_url, 'not posted') AS photos
FROM users u
LEFT JOIN photos p
  ON u.id = p.user_id
WHERE image_url IS NULL;

-- most liked photo + photo owner
SELECT 
  photos.image_url AS photo,
  users.username AS 'photo owner',
  COUNT(*) AS likes
FROM photos 
INNER JOIN likes 
  ON photos.id = likes.photo_id
INNER JOIN users
  ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY likes DESC
LIMIT 1;

--- get top most poster + no of posts
SELECT
  users.id,
  username,
  COUNT(*) AS posts
FROM users
INNER JOIN photos
  ON users.id = photos.user_id
GROUP BY users.id
ORDER BY posts DESC;

--- calculate avg no of photos per user
---- (total no of photos / total no of users)
SELECT 
  (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_posts;

--- 10 most popular hashtags
SELECT 
  tags.tag_name,
  COUNT(*) AS tag_count
FROM tags
INNER JOIN photo_tags
  ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY tag_count DESC
LIMIT 10;

--- find users that have liked each and every photo (behaviour of bots)
SELECT 
  users.username,
  MAX(photo_id) AS total_photos,
  COUNT(*) AS total_likes
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes = total_photos;
