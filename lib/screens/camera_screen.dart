import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamapp/screens/preview_screen.dart';
import 'package:flutter/cupertino.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraScreen> {
  final picker = ImagePicker();
  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewScreen(
                    picture: pickedFile!,
                  ))).then((result) {
        if (result != null) {
          Navigator.pop(context, result);
        }
      });
      //Navigator.pop(context);
    } on Exception catch (e) {
      final snackbar =
          SnackBar(content: Text('Error occured while selecting picture: $e'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return null;
    }
  }

  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewScreen(
                    picture: picture,
                  ))).then((result) {
        if (result != null) {
          Navigator.pop(context, result);
        }
      });
      //Navigator.pop(context);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          (_cameraController.value.isInitialized)
              ? CameraPreview(_cameraController)
              : Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator())),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.black),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                            _isRearCameraSelected
                                ? CupertinoIcons.switch_camera
                                : CupertinoIcons.switch_camera_solid,
                            color: Colors.white),
                        onPressed: () {
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(
                              widget.cameras![_isRearCameraSelected ? 0 : 1]);
                        },
                      )),
                      Expanded(
                          child: IconButton(
                        onPressed: takePicture,
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      )),
                      //const Spacer(),
                      Expanded(
                        child: IconButton(
                          onPressed: getImageFromGallery,
                          iconSize: 40,
                          icon: Icon(
                            Icons.insert_photo_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ]),
              )),
        ]),
      ),
    );
  }
}
