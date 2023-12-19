CREATE TABLE IF NOT EXISTS artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE INDEX idx_artist_name ON artist(artist_name);

CREATE TABLE IF NOT EXISTS album (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id, album_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE INDEX idx_album_name ON album(album_name);
CREATE INDEX idx_album_artist_id ON album(artist_id);

CREATE TABLE IF NOT EXISTS track (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES album(artist_id, album_id)
);

CREATE INDEX idx_track_name ON track(track_name);
CREATE INDEX idx_track_album_id ON track(album_id);
CREATE INDEX idx_track_artist_id ON track(artist_id);

CREATE TABLE IF NOT EXISTS played (
  played_id  INT AUTO_INCREMENT,
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  PRIMARY KEY (played_id),
  FOREIGN KEY (artist_id, album_id, track_id) REFERENCES track(artist_id, album_id, track_id)
);

CREATE INDEX idx_played_timestamp ON played(played);
CREATE INDEX idx_played_track_id ON played(track_id);
