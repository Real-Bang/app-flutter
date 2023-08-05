import 'package:flutter/material.dart';
import 'package:realbang_app/models/room_model.dart';
import 'package:realbang_app/screens/detail_screen.dart';

class RoomCard extends StatelessWidget {
  final RoomModel room;

  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: room.id,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xFFF1F1F1),
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    room.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ObjectSignContainer(
                    isObject: room.isObject,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              room.type,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFB53D43),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 5,
                            // ),
                            // ObjectSignContainer(
                            //   isObject: room.isObject,
                            // ),
                          ],
                        ),
                        Text(
                          '${room.priceType} ${room.price}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          room.description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFA1A1A3),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.bed,
                                  size: 15,
                                  color: Color(0xFFB53D43),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.bathroom,
                                  size: 15,
                                  color: Color(0xFFB53D43),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('3'),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              room.area,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              room.floor,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFFA1A1A3),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ObjectSignContainer extends StatelessWidget {
  final bool isObject;

  const ObjectSignContainer({
    super.key,
    required this.isObject,
  });

  @override
  Widget build(BuildContext context) {
    print(isObject);
    if (isObject) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "3D",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
