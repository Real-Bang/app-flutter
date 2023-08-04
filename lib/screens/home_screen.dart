import 'package:flutter/material.dart';
import 'package:realbang_app/services/api_services.dart';
import 'package:realbang_app/widgets/room_card_widget.dart';
import 'package:realbang_app/widgets/room_type_icon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final rooms = ApiService.getRoomList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFA1A1A3),
                        ),
                      ),
                      Text(
                        'Apalachin, NY',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 30,
                    color: const Color(0xFF5B5B5D),
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
              TextField(
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF1F1F1),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(fontSize: 17),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoomTypeIconWidget(
                      text: '원룸',
                      icon: Icon(
                        Icons.home_rounded,
                        size: 40,
                        color: Color(0xFFB53D43),
                      ),
                    ),
                    RoomTypeIconWidget(
                      text: '아파트',
                      icon: Icon(
                        Icons.apartment_rounded,
                        size: 40,
                        color: Color(0xFF019BA3),
                      ),
                    ),
                    RoomTypeIconWidget(
                      text: '빌라/투룸+',
                      icon: Icon(
                        Icons.other_houses_rounded,
                        size: 40,
                        color: Color(0xFFEA7E00),
                      ),
                    ),
                    RoomTypeIconWidget(
                      text: '오피스텔',
                      icon: Icon(
                        Icons.business_rounded,
                        size: 40,
                        color: Color(0xFF2459B0),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text(
                    'Nearby',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => RoomCard(room: rooms[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: rooms.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
