import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/domain/models/model.dart';
import 'package:restaurant_app/domain/models/order_model.dart';

class RDTBService {
  static final _database = FirebaseDatabase.instance;

  static Future<bool> orderAdd(OrderModel order) async {
    try {
      final folder = _database.ref("Ordered");
      final child = folder.child(order.id);
      await child.set(order.toJson());
      return true;
    } catch (e) {
      debugPrint("RDTBService: $e");
      return false;
    }
  }

  static Future<List<MenuModel>> getAllMenu() async {
   try{
     final folder = _database.ref("Menu");

     final data = await folder.get();
     final json = jsonDecode(jsonEncode(data.value)) as Map;
     return json.values.map((e) => MenuModel.fromJson(e as Map<String, Object?>)).toList();
   }catch(e){
     throw Exception("RDTBService => getAllMenu ====> $e");
   }
  }
 FirebaseDatabase get rdtb => _database;
}
