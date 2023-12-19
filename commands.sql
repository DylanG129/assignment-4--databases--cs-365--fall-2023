SELECT CONCAT(artist.artist_name, ' recorded ', album.album_name) AS Recording
FROM artist
JOIN album ON artist.artist_id = album.artist_id;

SELECT 
  (SELECT artist_name FROM artist WHERE artist_id = album.artist_id) AS artist_name,
  album_name
FROM album;

SELECT artist.artist_name, album.album_name
FROM artist
JOIN album ON artist.artist_id = album.artist_id
ORDER BY artist.artist_name, album.album_name;

SELECT album.album_name, track.track_name
FROM album
JOIN track ON album.album_id = track.album_id AND album.artist_id = track.artist_id
ORDER BY album.album_name, track.track_name;

SELECT track.track_name, track.time, played.played
FROM played
JOIN track ON played.artist_id = track.artist_id AND 
             played.album_id = track.album_id AND 
             played.track_id = track.track_id
ORDER BY played.played, track.track_name;

