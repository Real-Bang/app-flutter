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
        appBar: AppBar(
          title: const Text(
            "Realbang",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          elevation: 2,
        ),
        body: InteractiveViewer(
          child: const ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src: 'assets/object/ground.glb',
            alt: 'A 3D model of an astronaut',
            ar: true,
            autoPlay: false,
            autoRotate: false,
            disableZoom: false,
            cameraTarget: "10m 10m 10m",
            cameraOrbit: "50deg 75deg 1.5m",
          ),
        ));
  }
}
