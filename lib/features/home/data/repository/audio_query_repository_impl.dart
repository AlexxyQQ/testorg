import 'package:dartz/dartz.dart';
import 'package:musync/features/home/domain/entity/song_entity.dart';

import '../../../../core/failure/error_handler.dart';
import '../../domain/entity/album_entity.dart';
import '../../domain/entity/artist_entity.dart';
import '../../domain/entity/folder_entity.dart';
import '../../domain/repository/audio_query_repository.dart';
import '../data_source/query_data_source.dart';
import '../model/app_song_model.dart';

class AudioQueryRepositiryImpl implements IAudioQueryRepository {
  final IAudioQueryDataSource audioQueryDataSource;
  final AudioQueryDataSourceImpl audioQueryDataSourceImpl;

  AudioQueryRepositiryImpl({
    required this.audioQueryDataSource,
    required this.audioQueryDataSourceImpl,
  });

  @override
  Future<Either<AppErrorHandler, List<AppSongModel>>> getAllSongs({
    required Function(int) onProgress,
    bool? first,
    bool? refetch,
    required String token,
  }) async {
    final data = await audioQueryDataSource.getAllSongs(
      onProgress: onProgress,
      first: first,
      refetch: refetch,
      token: token,
    );
    return data;
  }

  @override
  Future<Either<AppErrorHandler, List<AlbumEntity>>> getAllAlbums({
    bool? refetch,
    required String token,
  }) async {
    return await audioQueryDataSource.getAllAlbums(
      refetch: refetch,
      token: token,
    );
  }

  @override
  Future<Either<AppErrorHandler, List<ArtistEntity>>> getAllArtists({
    bool? refetch,
    required String token,
  }) async {
    return await audioQueryDataSource.getAllArtists(
      refetch: refetch,
      token: token,
    );
  }

  @override
  Future<Either<AppErrorHandler, List<FolderEntity>>> getAllFolders({
    bool? refetch,
    required String token,
  }) async {
    return await audioQueryDataSourceImpl.getAllFolders(
      refetch: refetch,
      token: token,
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> updateSong({
    required SongEntity song,
    required String token,
  }) async {
    return await audioQueryDataSource.updateSong(
      song: AppSongModel.fromEntity(song),
      token: token,
    );
  }
}
