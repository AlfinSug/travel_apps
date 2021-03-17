import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_apps/api/services.dart';
import 'package:travel_apps/locater.dart';
import 'package:travel_apps/model/hotel_model.dart';

class CRUDModel extends ChangeNotifier {
  Services _services = locator<Services>();

  List<HotelModel> hotels;

  Future<List<HotelModel>> showHotels() async {
    var result = await _services.getDataHotels();
    hotels = result.documents
        .map((document) =>
            HotelModel.fromMap(document.data, document.documentID))
        .toList();
    return hotels;
  }

  Stream<QuerySnapshot> showHotelStream() {
    return _services.streamDataHotels();
  }

  Future<HotelModel> getHotelById(String id) async {
    var doc = await _services.getHotelsById(id);
    return HotelModel.fromMap(doc.data, doc.documentID);
  }

  Future delHotel(String id) async {
    var del = await _services.delHotels(id);
    return del;
  }

  Future updateHotel(HotelModel hotels, String id) async {
    var edit = await _services.updateHotels(hotels.toJson(), id);
    return edit;
  }

  Future addHotel(HotelModel hotels) async {
    var result = await _services.addHotels(hotels.toJson());
    return result;
  }
}
