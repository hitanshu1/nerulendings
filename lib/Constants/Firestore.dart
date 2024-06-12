// ignore_for_file: public_member_api_docs

part of 'Constants.dart';

class CollectionIDs {
  CollectionIDs._privateConstructor();
  static final CollectionIDs _instance = CollectionIDs._privateConstructor();
  static CollectionIDs get instance => _instance;

  static const String industries = 'industries';
  static const String remoteConfigurations = 'remoteConfigurations/';
}

class Firestore {
  static const int queryLimit = 20;
}
