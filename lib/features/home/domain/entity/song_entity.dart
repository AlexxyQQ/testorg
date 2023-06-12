import 'dart:convert';

class SongEntity {
  final int id;

  final String data;

  final String? uri;

  final String displayName;

  final String displayNameWOExt;

  final int size;

  final String? album;

  final String? albumId;

  final String? artist;

  final String? artistId;

  final String? genre;

  final String? genreId;

  final int? bookmark;

  final String? composer;

  final int? dateAdded;

  final int? dateModified;

  final int? duration;

  final String title;

  final int? track;

  final String fileExtension;

  final bool? isAlarm;

  final bool? isAudioBook;

  final bool? isMusic;

  final bool? isNotification;

  final bool? isPodcast;

  final bool isRingtone;
  SongEntity({
    required this.id,
    required this.data,
    required this.uri,
    required this.displayName,
    required this.displayNameWOExt,
    required this.size,
    this.album,
    this.albumId,
    this.artist,
    this.artistId,
    this.genre,
    this.genreId,
    this.bookmark,
    this.composer,
    this.dateAdded,
    this.dateModified,
    this.duration,
    required this.title,
    this.track,
    required this.fileExtension,
    this.isAlarm,
    this.isAudioBook,
    this.isMusic,
    this.isNotification,
    this.isPodcast,
    required this.isRingtone,
  });

  SongEntity copyWith({
    int? id,
    String? data,
    String? uri,
    String? displayName,
    String? displayNameWOExt,
    int? size,
    String? album,
    String? albumId,
    String? artist,
    String? artistId,
    String? genre,
    String? genreId,
    int? bookmark,
    String? composer,
    int? dateAdded,
    int? dateModified,
    int? duration,
    String? title,
    int? track,
    String? fileExtension,
    bool? isAlarm,
    bool? isAudioBook,
    bool? isMusic,
    bool? isNotification,
    bool? isPodcast,
    bool? isRingtone,
  }) {
    return SongEntity(
      id: id ?? this.id,
      data: data ?? this.data,
      uri: uri ?? this.uri,
      displayName: displayName ?? this.displayName,
      displayNameWOExt: displayNameWOExt ?? this.displayNameWOExt,
      size: size ?? this.size,
      album: album ?? this.album,
      albumId: albumId ?? this.albumId,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      genre: genre ?? this.genre,
      genreId: genreId ?? this.genreId,
      bookmark: bookmark ?? this.bookmark,
      composer: composer ?? this.composer,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
      duration: duration ?? this.duration,
      title: title ?? this.title,
      track: track ?? this.track,
      fileExtension: fileExtension ?? this.fileExtension,
      isAlarm: isAlarm ?? this.isAlarm,
      isAudioBook: isAudioBook ?? this.isAudioBook,
      isMusic: isMusic ?? this.isMusic,
      isNotification: isNotification ?? this.isNotification,
      isPodcast: isPodcast ?? this.isPodcast,
      isRingtone: isRingtone ?? this.isRingtone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'uri': uri,
      'displayName': displayName,
      'displayNameWOExt': displayNameWOExt,
      'size': size,
      'album': album,
      'albumId': albumId,
      'artist': artist,
      'artistId': artistId,
      'genre': genre,
      'genreId': genreId,
      'bookmark': bookmark,
      'composer': composer,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
      'duration': duration,
      'title': title,
      'track': track,
      'fileExtension': fileExtension,
      'isAlarm': isAlarm,
      'isAudioBook': isAudioBook,
      'isMusic': isMusic,
      'isNotification': isNotification,
      'isPodcast': isPodcast,
      'isRingtone': isRingtone,
    };
  }

  factory SongEntity.fromMap(Map<String, dynamic> map) {
    return SongEntity(
      id: map['_id'] as int,
      data: map['_data'] as String,
      uri: map['_uri'] != null ? map['_uri'] as String : null,
      displayName: map['_display_name'] as String,
      displayNameWOExt: map['_display_name_wo_ext'] as String,
      size: map['_size'] as int,
      album: map['album'] != null ? map['album'] as String : null,
      albumId: map['album_id'] != null ? "${map['album_id']}" : null,
      artist: map['artist'] != null ? map['artist'] as String : null,
      artistId: map['artist_id'] != null ? "${map['artist_id']}" : null,
      genre: map['genre'] != null ? map['genre'] as String : null,
      genreId: map['genre_id'] != null ? map['genre_id'] as String : null,
      bookmark: map['bookmark'] != null ? map['bookmark'] as int : null,
      composer: map['composer'] != null ? map['composer'] as String : null,
      dateAdded: map['date_added'] != null ? map['date_added'] as int : null,
      dateModified:
          map['date_modified'] != null ? map['date_modified'] as int : null,
      duration: map['duration'] != null ? map['duration'] as int : null,
      title: map['title'] as String,
      track: map['track'] != null ? map['track'] as int : null,
      fileExtension: map['file_extension'] as String,
      isAlarm: map['is_alarm'] != null ? map['is_alarm'] as bool : null,
      isAudioBook:
          map['is_audiobook'] != null ? map['is_audiobook'] as bool : null,
      isMusic: map['is_music'] != null ? map['is_music'] as bool : null,
      isNotification: map['is_notification'] != null
          ? map['is_notification'] as bool
          : null,
      isPodcast: map['is_podcast'] != null ? map['is_podcast'] as bool : null,
      isRingtone: map['is_ringtone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongEntity.fromJson(String source) =>
      SongEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongEntity(id: $id, data: $data, uri: $uri, displayName: $displayName, displayNameWOExt: $displayNameWOExt, size: $size, album: $album, albumId: $albumId, artist: $artist, artistId: $artistId, genre: $genre, genreId: $genreId, bookmark: $bookmark, composer: $composer, dateAdded: $dateAdded, dateModified: $dateModified, duration: $duration, title: $title, track: $track, fileExtension: $fileExtension, isAlarm: $isAlarm, isAudioBook: $isAudioBook, isMusic: $isMusic, isNotification: $isNotification, isPodcast: $isPodcast, isRingtone: $isRingtone)';
  }

  @override
  bool operator ==(covariant SongEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.data == data &&
        other.uri == uri &&
        other.displayName == displayName &&
        other.displayNameWOExt == displayNameWOExt &&
        other.size == size &&
        other.album == album &&
        other.albumId == albumId &&
        other.artist == artist &&
        other.artistId == artistId &&
        other.genre == genre &&
        other.genreId == genreId &&
        other.bookmark == bookmark &&
        other.composer == composer &&
        other.dateAdded == dateAdded &&
        other.dateModified == dateModified &&
        other.duration == duration &&
        other.title == title &&
        other.track == track &&
        other.fileExtension == fileExtension &&
        other.isAlarm == isAlarm &&
        other.isAudioBook == isAudioBook &&
        other.isMusic == isMusic &&
        other.isNotification == isNotification &&
        other.isPodcast == isPodcast &&
        other.isRingtone == isRingtone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        data.hashCode ^
        uri.hashCode ^
        displayName.hashCode ^
        displayNameWOExt.hashCode ^
        size.hashCode ^
        album.hashCode ^
        albumId.hashCode ^
        artist.hashCode ^
        artistId.hashCode ^
        genre.hashCode ^
        genreId.hashCode ^
        bookmark.hashCode ^
        composer.hashCode ^
        dateAdded.hashCode ^
        dateModified.hashCode ^
        duration.hashCode ^
        title.hashCode ^
        track.hashCode ^
        fileExtension.hashCode ^
        isAlarm.hashCode ^
        isAudioBook.hashCode ^
        isMusic.hashCode ^
        isNotification.hashCode ^
        isPodcast.hashCode ^
        isRingtone.hashCode;
  }
}
