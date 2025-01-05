import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';


abstract interface class MediaRemoteDataSource {
  Future<Either<Failure,ImageModel>> uploadImage({required UploadMediaToCloudParams params});
}