import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:musync/features/home/domain/entity/album_entity.dart';
import 'package:musync/features/home/domain/entity/playlist_entity.dart';
import 'package:musync/features/home/domain/entity/song_entity.dart';

class MusicQueryState {
  final Map<String, List<SongEntity>> albumWithSongs;
  final List<AlbumEntity> albums;
  final Map<String, List<SongEntity>> artistWithSongs;
  final Map<String, List<SongEntity>> folderWithSongs;
  final List<String> folders;
  final List<SongEntity> songs;
  final List<SongEntity> folderSongs;
  final bool permission;
  final Map<String, Map<String, List<SongEntity>>> everything;
  final List<PlaylistEntity> playlists;
  final bool createPlaylist;
  final bool addAllSongs;
  final bool onSearch;
  final Map<String, Map<String, List<SongEntity>>> filteredEverything;

  final String? error;
  final bool isLoading;
  final bool isUploading;
  final bool inLibrary;
  final List<Widget> pages = [];
  MusicQueryState({
    required this.albumWithSongs,
    required this.onSearch,
    required this.albums,
    required this.artistWithSongs,
    required this.folderWithSongs,
    required this.folders,
    required this.songs,
    required this.folderSongs,
    required this.permission,
    required this.everything,
    required this.playlists,
    required this.createPlaylist,
    required this.addAllSongs,
    this.error,
    required this.isLoading,
    required this.isUploading,
    required this.inLibrary,
    required this.filteredEverything,
  });

  factory MusicQueryState.initial() {
    return MusicQueryState(
      albumWithSongs: {},
      albums: [],
      artistWithSongs: {},
      folderWithSongs: {},
      folders: [],
      songs: [],
      folderSongs: [],
      permission: false,
      everything: {},
      playlists: [],
      createPlaylist: false,
      addAllSongs: false,
      error: null,
      isLoading: false,
      isUploading: false,
      inLibrary: false,
      onSearch: false,
      filteredEverything: {},
    );
  }

  MusicQueryState copyWith({
    Map<String, List<SongEntity>>? albumWithSongs,
    List<AlbumEntity>? albums,
    Map<String, List<SongEntity>>? artistWithSongs,
    Map<String, List<SongEntity>>? folderWithSongs,
    List<String>? folders,
    List<SongEntity>? songs,
    List<SongEntity>? folderSongs,
    bool? permission,
    Map<String, Map<String, List<SongEntity>>>? everything,
    List<PlaylistEntity>? playlists,
    bool? createPlaylist,
    bool? addAllSongs,
    String? error,
    bool? isLoading,
    bool? isUploading,
    bool? inLibrary,
    bool? onSearch,
    Map<String, Map<String, List<SongEntity>>>? filteredEverything,
  }) {
    return MusicQueryState(
      albumWithSongs: albumWithSongs ?? this.albumWithSongs,
      albums: albums ?? this.albums,
      artistWithSongs: artistWithSongs ?? this.artistWithSongs,
      folderWithSongs: folderWithSongs ?? this.folderWithSongs,
      folders: folders ?? this.folders,
      songs: songs ?? this.songs,
      folderSongs: folderSongs ?? this.folderSongs,
      permission: permission ?? this.permission,
      everything: everything ?? this.everything,
      playlists: playlists ?? this.playlists,
      createPlaylist: createPlaylist ?? this.createPlaylist,
      addAllSongs: addAllSongs ?? this.addAllSongs,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isUploading: isUploading ?? this.isUploading,
      inLibrary: inLibrary ?? this.inLibrary,
      onSearch: onSearch ?? this.onSearch,
      filteredEverything: filteredEverything ?? this.filteredEverything,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumWithSongs': albumWithSongs,
      'albums': albums.map((x) => x.toMap()).toList(),
      'artistWithSongs': artistWithSongs,
      'folderWithSongs': folderWithSongs,
      'folders': folders,
      'songs': songs.map((x) => x.toMap()).toList(),
      'folderSongs': folderSongs.map((x) => x.toMap()).toList(),
      'permission': permission,
      'everything': everything,
      'playlists': playlists.map((x) => x.toMap()).toList(),
      'createPlaylist': createPlaylist,
      'addAllSongs': addAllSongs,
      'error': error,
      'isLoading': isLoading,
      'isUploading': isUploading,
      'inLibrary': inLibrary,
      'onSearch': onSearch,
      'filteredEverything': filteredEverything,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'MusicQueryState(albumWithSongs: $albumWithSongs, albums: $albums, artistWithSongs: $artistWithSongs, folderWithSongs: $folderWithSongs, folders: $folders, songs: $songs, folderSongs: $folderSongs, permission: $permission, everything: $everything, playlists: $playlists, createPlaylist: $createPlaylist, addAllSongs: $addAllSongs, error: $error, isLoading: $isLoading, isUploading: $isUploading)';
  }

  @override
  bool operator ==(covariant MusicQueryState other) {
    if (identical(this, other)) return true;

    return mapEquals(other.albumWithSongs, albumWithSongs) &&
        listEquals(other.albums, albums) &&
        mapEquals(other.artistWithSongs, artistWithSongs) &&
        mapEquals(other.folderWithSongs, folderWithSongs) &&
        listEquals(other.folders, folders) &&
        listEquals(other.songs, songs) &&
        listEquals(other.folderSongs, folderSongs) &&
        other.permission == permission &&
        mapEquals(other.everything, everything) &&
        listEquals(other.playlists, playlists) &&
        other.createPlaylist == createPlaylist &&
        other.addAllSongs == addAllSongs &&
        other.error == error &&
        other.isLoading == isLoading &&
        other.inLibrary == inLibrary &&
        other.onSearch == onSearch &&
        mapEquals(other.filteredEverything, filteredEverything) &&
        other.isUploading == isUploading;
  }

  @override
  int get hashCode {
    return albumWithSongs.hashCode ^
        albums.hashCode ^
        artistWithSongs.hashCode ^
        folderWithSongs.hashCode ^
        folders.hashCode ^
        songs.hashCode ^
        folderSongs.hashCode ^
        permission.hashCode ^
        everything.hashCode ^
        playlists.hashCode ^
        createPlaylist.hashCode ^
        addAllSongs.hashCode ^
        error.hashCode ^
        isLoading.hashCode ^
        inLibrary.hashCode ^
        filteredEverything.hashCode ^
        onSearch.hashCode ^
        isUploading.hashCode;
  }
}
