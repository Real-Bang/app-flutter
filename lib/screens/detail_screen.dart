import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:realbang_app/models/room_detail_model.dart';
import 'package:realbang_app/screens/object_screen_glb.dart';
import 'package:realbang_app/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late RoomDetailModel room;

  @override
  void initState() {
    room = ApiService.getRoomDetailById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselWdiget(imageUrlList: room.imageUrlList),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: const Offset(1, 1),
                              color: Colors.black.withOpacity(0.5),
                            )
                          ]),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: const Offset(1, 1),
                              color: Colors.black.withOpacity(0.5),
                            )
                          ]),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ObjectScreenGlb(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.view_in_ar_rounded),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        room.type,
                        style: const TextStyle(
                          color: Color(0xFFB53D43),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Color(0xFFB53D43),
                      ),
                    ],
                  ),
                  Text(
                    '${room.priceType} ${room.price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    room.address,
                    style: const TextStyle(
                      color: Color(0xFFA1A1A3),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InfoBlock(
                            text: room.infos['area'],
                            icon: const Icon(
                              Icons.aspect_ratio,
                              color: Color(0xFFB53D43),
                              size: 20,
                            ),
                          ),
                          InfoBlock(
                            text: room.infos['type'],
                            icon: const Icon(
                              Icons.window_rounded,
                              color: Color(0xFFB53D43),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InfoBlock(
                            text: room.infos['parking'],
                            icon: const Icon(
                              Icons.local_parking_rounded,
                              color: Color(0xFFB53D43),
                              size: 20,
                            ),
                          ),
                          InfoBlock(
                            text: room.infos['floor'],
                            icon: const Icon(
                              Icons.stairs_rounded,
                              color: Color(0xFFB53D43),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '옵션 정보',
                        style: TextStyle(
                          color: Color(0xFFB53D43),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OptionList(
                        options: room.options,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  const Divider(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '상세설명',
                          style: TextStyle(
                            color: Color(0xFFB53D43),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          room.detailDescription,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionList extends StatelessWidget {
  OptionList({
    super.key,
    required this.options,
  });

  final List<String> options;
  final Map<String, dynamic> optionMap = {
    'bed': const Column(
      children: [
        Icon(Icons.bed_rounded),
        SizedBox(
          height: 5,
        ),
        Text('침대'),
      ],
    ),
    'sink': const Column(
      children: [
        Icon(Icons.countertops_rounded),
        SizedBox(
          height: 5,
        ),
        Text('싱크대'),
      ],
    ),
    'air_conditioner': const Column(
      children: [
        Icon(Icons.air_rounded),
        SizedBox(
          height: 5,
        ),
        Text('에어컨'),
      ],
    ),
    'desk': const Column(
      children: [
        Icon(Icons.desk_rounded),
        SizedBox(
          height: 5,
        ),
        Text('책상'),
      ],
    ),
    'fridge': const Column(
      children: [
        Icon(Icons.kitchen_rounded),
        SizedBox(
          height: 5,
        ),
        Text('에어컨'),
      ],
    ),
    'stove': const Column(
      children: [
        Icon(Icons.microwave_rounded),
        SizedBox(
          height: 5,
        ),
        Text('가스레인지'),
      ],
    ),
    'microwave': const Column(
      children: [
        Icon(Icons.microwave_rounded),
        SizedBox(
          height: 5,
        ),
        Text('전자레인지'),
      ],
    ),
    'washer': const Column(
      children: [
        Icon(Icons.local_laundry_service_rounded),
        SizedBox(
          height: 5,
        ),
        Text('세탁기'),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return optionMap[options[index]];
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 40,
        ),
        itemCount: options.length,
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  final String text;
  final Icon icon;

  const InfoBlock({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          icon,
          // Icon(
          //   Icons.bed,
          //   color: Color(0xFFB53D43),
          //   size: 20,
          // ),
          const SizedBox(
            width: 7,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class CarouselWdiget extends StatefulWidget {
  final List<String> imageUrlList;
  const CarouselWdiget({
    super.key,
    required this.imageUrlList,
  });

  @override
  State<CarouselWdiget> createState() => _CarouselWdigetState();
}

class _CarouselWdigetState extends State<CarouselWdiget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late List<Widget> imageSliders;

  @override
  void initState() {
    imageSliders = widget.imageUrlList
        .map((item) => ClipRRect(
                child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1500,
                ),
              ],
            )))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageUrlList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
