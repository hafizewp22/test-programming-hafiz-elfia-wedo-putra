CREATE TABLE film (
    film_id BIGINT(20) NOT NULL,
    title VARCHAR(200),
    release_year CHAR(4),
    description MEDIUMTEXT,
    rental_rate FLOAT,
    PRIMARY KEY (film_id)
);

CREATE TABLE category (
    category_id INT(20) NOT NULL,
    film BIGINT(20),
    last_update DATETIME,
    PRIMARY KEY (category_id),
    FOREIGN KEY (film) REFERENCES film(film_id)
);

CREATE TABLE film_category (
    film_id INT(20) NOT NULL,
    category_id BIGINT(20),
    last_update DATETIME,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO film (film_id, title, release_year, description, rental_rate)
VALUES
    (1, 'Film 1', '2023', 'Deskripsi Film 1', 4.99),
    (2, 'Film 2', '2022', 'Deskripsi Film 2', 3.99),
    (3, 'Film 3', '2023', 'Deskripsi Film 3', 2.99);

INSERT INTO category (category_id, film, last_update)
VALUES
    (1, 1, NOW()),
    (2, 2, NOW()),
    (3, 1, NOW());

INSERT INTO film_category (film_id, category_id, last_update)
VALUES
    (1, 1, NOW()),
    (1, 3, NOW()),
    (2, 2, NOW());

-- Jawaban:
-- Pertanyaan 4: Query Menampilkan Judul Film, Tahun Film, Nama Aktor:
SELECT film.title, film.release_year, actor.actor_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;

-- Pertanyaan 5: Query Menampilkan 5 kategori dengan film terbanyak: Nama Kategori, Jumlah Film
SELECT category.name AS Nama_Kategori, COUNT(film_category.film_id) AS Jumlah_Film
FROM film_category
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY Jumlah_Film DESC
LIMIT 5;

-- Pertanyaan 6: Query Menampilkan 5 film terfavorit (rental_rate tertinggi)
SELECT title AS Judul_Film, rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 5;

-- Pertanyaan 7: Berdasarkan Pertanyaan No. 6, Buat Query daftar 3 kategori terfavorit
SELECT category.name AS Nama_Kategori, COUNT(film_category.film_id) AS Jumlah_Film
FROM film_category
JOIN category ON film_category.category_id = category.category_id
WHERE film_category.film_id IN (
    SELECT film_id
    FROM film
    ORDER BY rental_rate DESC
    LIMIT 5
)
GROUP BY category.name
ORDER BY Jumlah_Film DESC
LIMIT 3;

