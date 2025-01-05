import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/repository/media_repository.dart';

class UploadMediaUseCase with UseCases<ImageModel, UploadMediaToCloudParams> {
  final _repository = locator<MediaRepository>();
  @override
  Future<Either<Failure, ImageModel>> call(UploadMediaToCloudParams params) {
    return _repository.uploadImage(params: params);
  }
}
