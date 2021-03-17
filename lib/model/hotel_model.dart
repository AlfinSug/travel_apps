class HotelModel {
  String id;
  String name;
  String address;
  int price;
  String desc;

  HotelModel({
    this.id,
    this.name,
    this.address,
    this.price,
    this.desc,
  });

  HotelModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        address = snapshot['address'] ?? '',
        price = snapshot['price'] ?? '',
        desc = snapshot['desc'] ?? '';

  toJson() {
    return {
      "name": name,
      "address": address,
      "price": price,
      "desc": desc,
    };
  }
}
