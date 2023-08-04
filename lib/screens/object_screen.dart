import 'package:flutter/material.dart';
import 'package:ditredi/ditredi.dart';

class ObjectScreen extends StatefulWidget {
  const ObjectScreen({super.key});

  @override
  State<ObjectScreen> createState() => _ObjectScreenState();
}

class _ObjectScreenState extends State<ObjectScreen> {
  late DiTreDiController _controller;
  late Future<List<Face3D>> roomObject;

  @override
  void initState() {
    super.initState();
    roomObject =
        ObjParser().loadFromResources("assets/object/garden/mesh_0.obj");
    _controller = DiTreDiController(
      rotationX: -20,
      rotationY: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Realbang",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        elevation: 2,
      ),
      body: Stack(
        children: [
          // Center(
          //   child: Cube(
          //     onSceneCreated: (Scene scene) {
          //       scene.world
          //           .add(Object(fileName: "assets/object/garden/mesh_0.obj"));
          //       scene.camera.zoom = 10;
          //     },
          //   ),
          // ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DiTreDiDraggable(
                  controller: _controller,
                  child: DiTreDi(
                    figures: [
                      Mesh3D(snapshot.data!),
                    ],
                    controller: _controller,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            future: roomObject,
          ),
        ],
      ),
    );
  }
}
