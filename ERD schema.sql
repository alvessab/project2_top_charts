-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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
    "artist_ID" INT,
    "album_title" VARCHAR(500)   NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_album" PRIMARY KEY (
        "album_ID"
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

CREATE TABLE "rank_Junction" (
    "rank_ID" SERIAL    NOT NULL,
    "song_ID" INT   NOT NULL,
    "provider_ID" INT   NOT NULL,
    "rank" INT   NOT NULL,
    "date_retrieved" timestamp  NOT NULL,
    "lastUpdate" timestamp default localtimestamp  NOT NULL
);

CREATE TABLE "spotify_Info" (
    "ID" SERIAL   NOT NULL,
    "song_ID" INT   NOT NULL,
    "stream_count" INT,
    "spotify_peak_rank" INT,
    "spotify_previous_rank" INT,
    "spotify_streak_days" INT,
    "lastUpdate" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_spotify_Info" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "album" ADD CONSTRAINT "fk_album_artist_ID" FOREIGN KEY("artist_ID")
REFERENCES "artist" ("artist_ID");

ALTER TABLE "song" ADD CONSTRAINT "fk_song_artist_ID" FOREIGN KEY("artist_ID")
REFERENCES "artist" ("artist_ID");

ALTER TABLE "song" ADD CONSTRAINT "fk_song_album_ID" FOREIGN KEY("album_ID")
REFERENCES "album" ("album_ID");

ALTER TABLE "rank_Junction" ADD CONSTRAINT "fk_rank_Junction_song_ID" FOREIGN KEY("song_ID")
REFERENCES "song" ("song_ID");

ALTER TABLE "rank_Junction" ADD CONSTRAINT "fk_rank_Junction_provider_ID" FOREIGN KEY("provider_ID")
REFERENCES "provider" ("provider_ID");

ALTER TABLE "spotify_Info" ADD CONSTRAINT "fk_spotify_Info_song_ID" FOREIGN KEY("song_ID")
REFERENCES "song" ("song_ID");

