CREATE TABLE "artist" (
    "artist_ID" INT   NOT NULL,
    "artist_name" VARCHAR(500)   NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_artist" PRIMARY KEY (
        "artist_ID"
     )
);

CREATE TABLE "provider" (
    "provider_ID" INT   NOT NULL,
    "provider_name" VARCHAR(50)   NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_provider" PRIMARY KEY (
        "provider_ID"
     )
);

CREATE TABLE "album" (
    "album_ID" INT   NOT NULL,
    "album_title" VARCHAR(500)   NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_album" PRIMARY KEY (
        "album_ID"
     )
);

CREATE TABLE "albumartist" (
    "ID" SERIAL   NOT NULL,
    "album_ID" INT NOT NULL,
    "artist_ID" INT,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_albumartist" PRIMARY KEY (
        "ID"
     )
);


CREATE TABLE "song" (
    "song_ID" INT   NOT NULL,
    "artist_ID" INT,
    "album_ID" INT,
    "song_name" VARCHAR(500)   NOT NULL,
    "song_length" VARCHAR(10),
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_song" PRIMARY KEY (
        "song_ID"
     )
);

CREATE TABLE "rank_junction" (
    "ID" SERIAL   NOT NULL,
    "song_ID" INT   NOT NULL,
    "provider_ID" INT   NOT NULL,
    "rank" INT   NOT NULL,
    "date_retrieved" timestamp   NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_rank_junction" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "spotify_info" (
    "ID" SERIAL   NOT NULL,
    "song_ID" INT   NOT NULL,
    "stream_count" INT,
    "spotify_peak_rank" INT,
    "spotify_previous_rank" INT,
    "spotify_streak_days" INT,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_spotify_info" PRIMARY KEY (
        "ID"
     )
);


ALTER TABLE "albumartist" ADD CONSTRAINT "fk_albumartist_album_ID" FOREIGN KEY("album_ID")
REFERENCES "album" ("album_ID");

ALTER TABLE "albumartist" ADD CONSTRAINT "fk_albumartist_artist_ID" FOREIGN KEY("artist_ID")
REFERENCES "artist" ("artist_ID");

ALTER TABLE "song" ADD CONSTRAINT "fk_song_artist_ID" FOREIGN KEY("artist_ID")
REFERENCES "artist" ("artist_ID");

ALTER TABLE "song" ADD CONSTRAINT "fk_song_album_ID" FOREIGN KEY("album_ID")
REFERENCES "album" ("album_ID");

ALTER TABLE "rank_junction" ADD CONSTRAINT "fk_rank_junction_song_ID" FOREIGN KEY("song_ID")
REFERENCES "song" ("song_ID");

ALTER TABLE "rank_junction" ADD CONSTRAINT "fk_rank_junction_provider_ID" FOREIGN KEY("provider_ID")
REFERENCES "provider" ("provider_ID");

ALTER TABLE "spotify_info" ADD CONSTRAINT "fk_spotify_info_song_ID" FOREIGN KEY("song_ID")
REFERENCES "song" ("song_ID");



