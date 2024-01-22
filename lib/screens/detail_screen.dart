import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realbang_app/models/room_detail_model.dart';
import 'package:realbang_app/screens/object_screen_webview.dart';
import 'package:realbang_app/services/api_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselWidget(
                  imageUrlList: room.imageUrlList,
                  objectLink: room.objectLink,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          // ObjectRenderButton(
                          //   objectLink: room.objectLink,
                          // ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ObjectScreenWebView(
                                          objectLink: room.objectLink,
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB53D43),
                          ),
                          icon: const Icon(
                            Icons.view_in_ar_rounded,
                            size: 18,
                          ),
                          label: const Text(
                            'View in 3D',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
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
                    height: 1,
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

class ObjectRenderButton extends StatelessWidget {
  final dynamic objectLink;
  const ObjectRenderButton({
    super.key,
    required this.objectLink,
  });

  @override
  Widget build(BuildContext context) {
    if (objectLink == null) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
              builder: (context) => ObjectScreenWebView(
                objectLink: objectLink,
              ),
            ),
          );
        },
        icon: const Icon(Icons.view_in_ar_rounded),
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

class CarouselWidget extends StatefulWidget {
  final List<String> imageUrlList;
  final dynamic objectLink;
  const CarouselWidget({
    super.key,
    required this.imageUrlList,
    required this.objectLink,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late List<Widget> imageSliders;
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'http://ec2-3-37-88-108.ap-northeast-2.compute.amazonaws.com:8080/static/animate.html?scene=${widget.objectLink}'));

    imageSliders = widget.imageUrlList
        .map((item) => ClipRRect(
                child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1500,
                  height: 1000,
                ),
              ],
            )))
        .toList();

    if (widget.objectLink != null) {
      imageSliders.insert(
          0,
          ClipRRect(
            child: WebViewWidget(controller: controller),
          ));
    }
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
              children: imageSliders.asMap().entries.map((entry) {
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
