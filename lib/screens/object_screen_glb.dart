import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ObjectScreenGlb extends StatefulWidget {
  const ObjectScreenGlb({super.key});

  @override
  State<ObjectScreenGlb> createState() => _ObjectScreenGlbState();
}

class _ObjectScreenGlbState extends State<ObjectScreenGlb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        InteractiveViewer(
          child: const ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src: 'assets/object/ground.glb',
            alt: 'A 3D model of an astronaut',
            autoPlay: false,
            autoRotate: false,
            disableZoom: false,
            cameraTarget: "0m 0m -0.5m",
            cameraOrbit: "0deg 180deg 1.5m",
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
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
      ],
    ));
  }
}
