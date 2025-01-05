import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/media/data/data/sources/remote_data_source/media_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';

class MediaRemoteDataSourceImpl implements MediaRemoteDataSource {
  final _firebaseService = locator<FirebaseService>();
  @override
  Future<Either<Failure, ImageModel>> uploadImage(
      {required UploadMediaToCloudParams params}) async {
    final res = await _firebaseService.uploadFile(
        path: params.path, file: params.file, imageName: params.imageName);

    return res.fold(
      (l) => Left(l),
      (r) async {
        final imageModel = ImageModel.fromFirebaseMetadata(
            r.metadata, params.path, params.imageName, r.imageUrl);
        final res = await _firebaseService.addProductToDb(
            dbName: "Images",
            product:
                imageModel.copyWith(mediaCategory: params.category).toJson());

        return res.fold(
          (l) => Left(l),
          (r) => Right(imageModel),
        );
      },
    );
  }
}
