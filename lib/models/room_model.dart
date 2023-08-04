class RoomModel {
  final int id;
  final String imageUrl, type, priceType, price, description, area, floor;

  RoomModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        type = json['type'],
        priceType = json['priceType'],
        price = json['price'],
        description = json['description'],
        area = json['area'],
        floor = json['floor'];
}
