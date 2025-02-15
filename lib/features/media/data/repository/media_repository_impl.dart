import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/media/data/data/sources/remote_data_source/media_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/delete_image_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/fetch_images_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/fetch_more_images_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/repository/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final _remoteDataSource = locator<MediaRemoteDataSource>();
  @override
  Future<Either<Failure, ImageModel>> uploadImage(
      {required UploadMediaToCloudParams params}) {
    return _remoteDataSource.uploadImage(params: params);
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchImages(
      {required FetchImagesParams params}) {
    return _remoteDataSource.fetchImages(params: params);
  }

  @override
  Future<Either<Failure, List<ImageModel>>> loadMoreImages(
      {required FetchMoreImagesParams params}) {
    return _remoteDataSource.loadMoreImages(params: params);
  }

  @override
  Future<Either<Failure, void>> deleteImage(
      {required DeleteImageParams params}) {
    return _remoteDataSource.deleteImage(params: params);
  }
}
