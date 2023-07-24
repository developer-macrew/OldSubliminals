import 'package:common/common.dart';

import 'environment.dart';
import 'package:minio/minio.dart';

class SpacesService {
  late final Minio minio;
  late final String bucket;

  SpacesService(Environment env) {
    minio = Minio(
      region: env.spacesRegion,
      endPoint: env.spacesEndpoint,
      accessKey: env.spacesKey,
      secretKey: env.spacesSecret,
    );
    bucket = env.spacesBucket;
  }

  Future<String> getDownloadUrl(String path) async {
    return minio.presignedGetObject(bucket, path);
  }

  Future<Result<bool>> delete(String path) async {
    try {
      await minio.removeObject(bucket, path);
      return Result.ok(true);
    } catch (e) {
      print('delete ($path) failed: $e');
      return Result.error(e.toString());
    }
  }
}
