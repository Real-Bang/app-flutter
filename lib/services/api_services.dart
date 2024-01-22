import 'package:realbang_app/models/room_detail_model.dart';
import 'package:realbang_app/models/room_model.dart';

class ApiService {
  static List<dynamic> roomData = [
    {
      'id': 1,
      'imageUrl':
          'https://cdn.ggumim.co.kr/cache/star/600/20180116113100dS4z4idEwl.jpg',
      'imageUrlList': [
        'https://cdn.ggumim.co.kr/cache/star/600/20180116113100dS4z4idEwl.jpg',
        'https://www.zipdeco.co.kr/upload/2019/10/28/EDITOR_201910280549536450_t3YFi',
        'https://i.namu.wiki/i/qKxcAi_HHGm1iaFqOWf8mrp5xAPjPDTOkxTtNBy5s6qpFXrL16tWL0SiYD0Z57_tLcd_EycaAerp4WtT-rtn9Q.webp',
      ],
      'objectLink': null,
      'type': '원룸',
      'priceType': '월세',
      'price': '500/52',
      'description': '위치좋은 신축급 원룸 보증금 조율가능',
      'address': '수원시 장안구 율전동',
      'infos': {
        'area': '19.83m\u00b2',
        'type': '오픈형 원룸(욕실 1개)',
        'parking': '주차 가능',
        'floor': '6층',
      },
      'options': [
        'bed',
        'air_conditioner',
        'desk',
        'fridge',
        'sink',
        'stove',
        'washer',
        'microwave',
      ],
      'detailDescription': '''성대역 도보 8분거리
신축 첫입주
엘리베이터사용
넓은창문있는방 채광 통풍굿
첫입주라 원하는 타입의 방 고를수있어요~'''
    },
    {
      'id': 2,
      'imageUrl':
          'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/room/room_1.jpg',
      'imageUrlList': [
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/room/room_1.jpg',
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/room/room_2.jpg',
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/room/room_3.jpg',
      ],
      'objectLink': 'http://10.0.2.2:3000/',
      'type': '원룸',
      'priceType': '월세',
      'price': '500/50',
      'description': 'v 신축 2년차 풀옵션 깨끗한 원룸 v',
      'address': '수원시 장안구 천천동',
      'infos': {
        'area': '23.14m\u00b2',
        'type': '분리형 원룸(욕실 1개)',
        'parking': '주차 불가',
        'floor': '3층',
      },
      'options': [
        'air_conditioner',
        'fridge',
        'sink',
        'stove',
        'washer',
        'microwave',
      ],
      'detailDescription': '''성대역 도보 8분거리
신축 첫입주
엘리베이터사용
넓은창문있는방 채광 통풍굿
첫입주라 원하는 타입의 방 고를수있어요~'''
    },
    {
      'id': 3,
      'imageUrl':
          'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/club/club_1.jpg',
      'imageUrlList': [
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/club/club_1.jpg',
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/club/club_2.jpg',
        'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/uploads/images/club/club_3.jpg',
      ],
      'objectLink': 'http://10.0.2.2:3000/',
      'type': '원룸',
      'priceType': '월세',
      'price': '500/55',
      'description': '신축 첫입주 엘베있어요',
      'address': '수원시 장안구 율전동',
      'infos': {
        'area': '23.8m\u00b2',
        'type': '분리형 원룸(욕실 1개)',
        'parking': '주차 가능',
        'floor': '2층',
      },
      'options': [
        'bed',
        'air_conditioner',
        'desk',
        'fridge',
        'sink',
        'stove',
        'washer',
        'microwave',
      ],
      'detailDescription': '''성대역 도보 8분거리
신축 첫입주
엘리베이터사용
넓은창문있는방 채광 통풍굿
첫입주라 원하는 타입의 방 고를수있어요~'''
    },
  ];

  static List<RoomModel> getRoomList() {
    List<dynamic> rooms = [];

    for (var room in roomData) {
      room['floor'] = room['infos']['floor'];
      room['area'] = room['infos']['area'];
      rooms.add(room);
    }

    return [for (var room in rooms) RoomModel.fromJson(room)];
  }

  static RoomDetailModel getRoomDetailById(int id) {
    Map<String, dynamic> json =
        roomData.where((room) => room['id'] == id).toList()[0];
    return RoomDetailModel.fromJson(json);
  }
}
