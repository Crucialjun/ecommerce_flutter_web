import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/fetch_images_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/fetch_more_images_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';

abstract class MediaRepository {
  Future<Either<Failure, ImageModel>> uploadImage(
      {required UploadMediaToCloudParams params});
      Future<Either<Failure, List<ImageModel>>> fetchImages({required FetchImagesParams params});
      Future<Either<Failure, List<ImageModel>>> loadMoreImages({required FetchMoreImagesParams params});
}
