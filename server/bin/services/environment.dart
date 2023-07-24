import 'dart:convert';
import 'dart:io';

import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:firebase_admin_sdk/firebase_admin.dart';
import 'package:firebase_admin_sdk/src/auth/credential.dart';
import 'package:yaml/yaml.dart';

class Environment {
  final String version;
  final String engineUrl;
  final Credential? googleCredential;
  final String spacesRegion;
  final String spacesEndpoint;
  final String spacesKey;
  final String spacesSecret;
  final String spacesBucket;
  final String mongoUser;
  final String mongoPass;
  final String mongoHost;
  final String mongoDb;
  final String debugToken;
  final String debugUser;

  const Environment({
    required this.version,
    required this.engineUrl,
    this.googleCredential,
    required this.spacesRegion,
    required this.spacesEndpoint,
    required this.spacesKey,
    required this.spacesSecret,
    required this.spacesBucket,
    required this.mongoUser,
    required this.mongoPass,
    required this.mongoHost,
    required this.mongoDb,
    this.debugToken = '',
    this.debugUser = '',
  });

  factory Environment.read() {
    final dotEnv = DotEnv(filePath: '.env');
    if (!dotEnv.exists()) {
      dotEnv.createNew();
    }
    dotEnv.getDotEnv();

    String _getEnv(String key, [String def = '']) =>
        Platform.environment[key] ?? dotEnv.get(key) ?? def;

    final pubspec = loadYaml(File('pubspec.yaml').readAsStringSync());
    String version = pubspec['version'] ?? '0.0.0';

    String serviceAccount = _getEnv('SERVICE_ACCOUNT_JSON');
    Credential? googleCredential = serviceAccount.isEmpty
        ? null
        : ServiceAccountCredential(json.decode(serviceAccount));

    return Environment(
      version: version,
      engineUrl: _getEnv('ENGINE_URL'),
      googleCredential: googleCredential,
      spacesRegion: _getEnv('SPACES_REGION'),
      spacesEndpoint: _getEnv('SPACES_ENDPOINT'),
      spacesKey: _getEnv('SPACES_KEY'),
      spacesSecret: _getEnv('SPACES_SECRET'),
      spacesBucket: _getEnv('SPACES_BUCKET'),
      mongoUser: _getEnv('MONGO_USER'),
      mongoPass: _getEnv('MONGO_PASS'),
      mongoHost: _getEnv('MONGO_HOST'),
      mongoDb: _getEnv('MONGO_DB'),
      debugToken: _getEnv('DEBUG_TOKEN'),
      debugUser: _getEnv('DEBUG_USER'),
    );
  }
}
