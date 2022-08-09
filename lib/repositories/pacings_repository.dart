import 'package:localstore/localstore.dart';

import '../models/pacing.dart';

class PacingsRepository {
  static const String collection = "Pacings";
  final db = Localstore.instance;

  Future<List<Pacing>> getPacings() async {
    final items = await db.collection(collection).get();
    if (items == null) {
      return List.empty();
    }

    return items.values.map((e) => Pacing.fromJson(e)).toList();
  }

  Future<Pacing?> getPacing(String name) async {
    final item = await db.collection(collection).doc(name).get();
    if (item == null) {
      return null;
    }

    return Pacing.fromJson(item);
  }

  Future addPacing(Pacing pacing) async {
    final item = await db.collection(collection).doc(pacing.name).get();
    if (item != null) {
      throw Exception("Item with name ${pacing.name} already exist");
    }

    db.collection(collection).doc(pacing.name).set(pacing.toJson());
  }

  Future editPacing(Pacing pacing) async {
    final item = await db.collection(collection).doc(pacing.name).get();
    if (item == null) {
      throw Exception("Item with name ${pacing.name} doesn't exist");
    }

    db.collection(collection).doc(pacing.name).set(pacing.toJson());
  }

  Future deletePacing(String name) async {
    await db.collection(collection).doc(name).delete();
  }
}
