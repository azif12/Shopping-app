import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late List<VideoPlayerController> _controllers;
  int _currentPage = 0;
  final List<String> _videoPaths = [
    'assests/images/vd1.mp4',
    'assests/images/vd2.mp4',
    'assests/images/vd5.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  Future<void> _initializeControllers() async {
    _controllers = [];
    for (var path in _videoPaths) {
      try {
        var controller = VideoPlayerController.asset(path);
        await controller.initialize();
        _controllers.add(controller);
        if (_controllers.length == 1) {
          _controllers[0].play();
          _controllers[0].setLooping(true);
        }
      } catch (e) {
        print('Error initializing video at $path: $e');
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _controllers[_currentPage].pause();
      _controllers[_currentPage].seekTo(Duration.zero);
      _currentPage = index;
      if (_controllers[index].value.isInitialized) {
        _controllers[_currentPage].play();
        _controllers[_currentPage].setLooping(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _controllers.length,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              _controllers[index].value.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controllers[index].value.size.width,
                          height: _controllers[index].value.size.height,
                          child: VideoPlayer(_controllers[index]),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
              Positioned(
                top: 30,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promotions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Icon(Icons.favorite, color: const Color.fromARGB(255, 255, 0, 0,),size: 30),
                      Text(
                        '102',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Icon(Icons.comment, color: Colors.white,size: 30,),
                      Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Icon(Icons.share, color: Colors.white,size: 30,),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
