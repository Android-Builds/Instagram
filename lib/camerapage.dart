import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  List<CameraDescription> cameras;

  getCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        children: [
          CameraPreview(controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlineButton(
                  onPressed: () {},
                  shape: new CircleBorder(),
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Icon(
                      Icons.brightness_1,
                      color: Colors.white,
                      size: 80.0,
                    ),
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(60),
                //   child: Stack(
                //     children: [
                //       Cutout(
                //         color: Colors.white,
                //         child: Icon(
                //           Icons.brightness_1,
                //           size: 80.0,
                //         ),
                //       ),
                //       Positioned(
                //         left: 5.0,
                //         top: 5.0,
                //         child: Icon(
                //           Icons.brightness_1,
                //           size: 70.0,
                //           color: Colors.white,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 50.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Cutout extends StatelessWidget {
  const Cutout({
    Key key,
    @required this.color,
    @required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcOut,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [color], stops: [0.0]).createShader(bounds),
      child: child,
    );
  }
}

// brightness_1
