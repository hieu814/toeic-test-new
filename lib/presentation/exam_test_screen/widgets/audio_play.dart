import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:toeic_test/core/app_export.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final bool autoPlay;
  final bool isWordWidget;
  const AudioPlayerWidget(
      {Key? key,
      this.isWordWidget = false,
      required this.audioUrl,
      required this.autoPlay})
      : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration audioDuration = Duration();
  Duration audioPosition = Duration();
  double sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration duration) {
      print("duration ${duration}");
      setState(() {
        audioDuration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        audioPosition = position;
        sliderValue = audioPosition.inMilliseconds.toDouble();
      });
    });
    audioPlayer.onPlayerStateChanged.listen(
      (it) {
        switch (it) {
          case PlayerState.stopped:
            setState(() {
              isPlaying = false;
            });
            break;
          case PlayerState.completed:
            setState(() {
              isPlaying = false;
            });
            break;
          default:
            break;
        }
      },
    );
    if (widget.autoPlay) {
      _play();
    }
  }

  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  }

  Future<void> _play() async {
    try {
      print("audio url ${widget.audioUrl}");
      await audioPlayer
          .play(UrlSource(ApiConstant.getFileUrl(widget.audioUrl)));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    await audioPlayer.stop();

    setState(() {
      isPlaying = false;
      audioPosition = Duration();
      sliderValue = 0.0;
    });
  }

  Future<void> _seek(double value) async {
    await audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isWordWidget) {
      return GestureDetector(
        onTap: () {
          _play();
        },
        child: Icon(
          Icons.volume_up_sharp,
          size: 50,
          color: Colors.blue,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${audioPosition.inMinutes}:${(audioPosition.inSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Slider(
              value: sliderValue < audioDuration.inMilliseconds.toDouble()
                  ? sliderValue
                  : audioDuration.inMilliseconds.toDouble(),
              min: 0.0,
              max: audioDuration.inMilliseconds.toDouble(),
              onChanged: (value) {
                if (value < audioDuration.inMilliseconds.toDouble() - 100) {
                  // setState(() {
                  //   sliderValue = value;
                  // });
                }
              },
              onChangeEnd: _seek,
            ),
          ),
          Text(
            '${audioDuration.inMinutes}:${(audioDuration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () async {
              double seekval = audioPosition.inMilliseconds.toDouble() - 5000;
              _seek(seekval);
            },
            icon: const Icon(Icons.forward_5),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
            onPressed: () {
              isPlaying ? _stop() : _play();
            },
          ),
        ],
      ),
    );
  }
}
