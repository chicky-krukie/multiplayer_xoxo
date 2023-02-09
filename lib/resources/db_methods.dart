import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:multiplayer_xoxo/utils/constants.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(databaseURL);
    await db.open();
    inspect(db);
    userCollection = db.collection(collectionURL);
  }
}
