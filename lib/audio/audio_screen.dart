import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  AudioPlayerScreenState createState() => AudioPlayerScreenState();
}

class AudioPlayerScreenState extends State<AudioPlayerScreen>
    with TickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _totalDuration = Duration.zero;
  late Stream<Duration> _positionStream;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    audioInit();

    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  void audioInit() {
    _audioPlayer = AudioPlayer();
    _positionStream = _audioPlayer.onPositionChanged;
    _audioPlayer.setSourceUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3');
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.play(UrlSource(
            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'));
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Audio Player'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Animated Album Art
              RotationTransition(
                turns: _rotateController,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.shutterstock.com/image-vector/music-poster-header-electronic-festival-600nw-2340074913.jpg', // Replace with actual image URL
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Song Title and Artist
              Text(
                'Song Title',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Artist Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),

              // Audio Progress Bar
              StreamBuilder<Duration>(
                stream: _positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  return Column(
                    children: [
                      Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white70,
                        value: position.inSeconds.toDouble(),
                        min: 0,
                        max: _totalDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                      Text(
                        '${position.toString().split('.').first} / ${_totalDuration.toString().split('.').first}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),

              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: IconButton(
                  key: ValueKey<bool>(_isPlaying),
                  icon: Icon(
                    _isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    size: 90,
                    color: Colors.white,
                  ),
                  onPressed: _togglePlayPause,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
    _rotateController.dispose();
  }
}
