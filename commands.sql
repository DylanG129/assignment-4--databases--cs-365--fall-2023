SELECT CONCAT(artist.artist_name, ' recorded ', album.album_name) AS Recording
FROM artist
JOIN album ON artist.artist_id = album.artist_id;

SELECT artist_name 
FROM artist 
WHERE artist_id IN (
    SELECT artist_id 
    FROM album 
    WHERE album_name IN ('Dysnomia', 'Turn on the Bright Lights', 'Dead Cool', 'Houdini', 'Come on Die Young', 'Every Country’s Sun', 'Heads Up')
);

