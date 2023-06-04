import 'package:flip_card/flip_card.dart';
import 'package:toeic_test/presentation/word_topic_screen/models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

class FlipWordWidget extends StatelessWidget {
  final WordModel word;
  VoidCallback? onTapPlayAudio;
  FlipWordWidget({required this.word, this.onTapPlayAudio});

  @override
  Widget build(BuildContext context) {
    print("hieu ${word.image}");
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(children: [
          Padding(
            padding: getPadding(all: 28),
            child: SizedBox(
              height: 200,
              child: CustomImageView(
                url: word.image.trim(),
                radius: BorderRadiusStyle.txtRoundedBorder5,
              ),
            ),
          ),
          Container(
            // padding: getPadding(top: 32, left: 10, right: 10, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(word.name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtRubikBold24.copyWith(fontSize: 24)),
                      ),
                      Text(word.type,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRegular14
                              .copyWith(fontSize: 22)),
                      GestureDetector(
                        onTap: () {
                          onTapPlayAudio?.call();
                        },
                        child: Icon(
                          Icons.volume_up_sharp,
                          size: 50,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
                /*3*/
              ],
            ),
          ),
        ]),
      ),
      back: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: getPadding(all: 10),
          child: WordWidget(
            word: word,
          ),
        )),
      ),
    );
  }
}

class WordWidget extends StatelessWidget {
  final WordModel word;

  WordWidget({required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          word.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "(${word.type})",
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        if (word.mean.isNotEmpty) ...[
          SizedBox(height: 10),
          Text('Meaning:',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRubikRegular18
                  .copyWith(letterSpacing: getHorizontalSize(0.23))),
          SizedBox(height: 2),
          Text(word.mean,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRubikBold24),
        ],
        SizedBox(height: 8),
        if (word.definition.isNotEmpty) ...[
          SizedBox(height: 10),
          Text('Definition:',
              // overflow: TextOverflow.ellipsis,
              maxLines: 20,
              // textAlign: TextAlign.,
              style: AppStyle.txtRubikRegular18),
          SizedBox(height: 2),
          Text(word.definition,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRubikRegular18),
        ],
        if (word.example.isNotEmpty) ...[
          SizedBox(height: 10),
          Text('Example:',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRubikRegular18
                  .copyWith(letterSpacing: getHorizontalSize(0.23))),
          SizedBox(height: 8),
          Text(
            word.example,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}
