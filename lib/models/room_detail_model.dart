class RoomDetailModel {
  final int id;
  final String type, priceType, price, description, address, detailDescription;
  final List<String> imageUrlList, options;
  final Map<String, dynamic> infos;

  RoomDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrlList = json['imageUrlList'],
        type = json['type'],
        priceType = json['priceType'],
        price = json['price'],
        description = json['description'],
        address = json['address'],
        infos = json['infos'],
        options = json['options'],
        detailDescription = json['detailDescription'];
}
