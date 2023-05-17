
// class WordCategory extends GetWidget<WordCategoryController> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: CategoryWidget(
//             index: 1,
//           )),
//     );
//   }
// }

// class CategoryWidget extends StatefulWidget {
//   final int index;
//   const CategoryWidget({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
//   List<Topic> categories = [];
//   String str =
//       "";
//   List<Topic> createCategoryList(String jsonStr) {
//     Map<String, dynamic> jsonList = jsonDecode(jsonStr);
//     List<dynamic> jsss = jsonList["topics"] ?? [];
//     // print(jsonList["topics"]);
//     return jsss.map((json) => Topic.fromJson(json)).toList();
//   }

//   int _currentCarouselIndex = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   final CarouselController _controller = CarouselController();
//   @override
//   Widget build(BuildContext context) {
//     categories = createCategoryList(str);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(
//             "$_currentCarouselIndex" ?? "",
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: getPadding(top: 20, left: 10, right: 10),
//               child: LinearPercentIndicator(
//                 percent: _currentCarouselIndex / categories[0].words.length,
//                 lineHeight: 10,
//                 barRadius: Radius.circular(5),
//               ),
//             ),
//             Expanded(
//               child: CarouselSlider.builder(
//                 carouselController: _controller,
//                 itemCount: categories[0].words.length,
//                 itemBuilder: (BuildContext context, int index, int realIndex) {
//                   final WordModel word = categories[0].words[index];
//                   return FlipWordWidget(
//                     word: word,
//                   );
//                 },
//                 options: CarouselOptions(
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentCarouselIndex = index;
//                     });
//                   },
//                   aspectRatio: 10 / 11,
//                   viewportFraction: 0.9,
//                   enlargeCenterPage: true,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: getPadding(all: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         _controller.previousPage();
//                       },
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.black,
//                       )),
//                   Spacer(),
//                   IconButton(
//                       onPressed: () {
//                         _controller.nextPage();
//                       },
//                       icon: Icon(Icons.arrow_forward_ios, color: Colors.black))
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

// class Category {
//   String id;
//   String image;
//   String name;
//   String description;
//   List<Topic> topics;

//   Category({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.description,
//     required this.topics,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     List<dynamic> topicList = json['topics'] ?? [];
//     List<Topic> topics =
//         topicList.map((topic) => Topic.fromJson(topic)).toList();

//     return Category(
//       id: json['id'],
//       image: json['image'],
//       name: json['name'],
//       description: json['description'],
//       topics: topics,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     List<Map<String, dynamic>> topics =
//         this.topics.map((topic) => topic.toJson()).toList();

//     return {
//       'id': this.id,
//       'image': this.image,
//       'name': this.name,
//       'description': this.description,
//       'topics': topics,
//     };
//   }
// }

// class Topic {
//   final String id;
//   final String image;
//   final String name;
//   final int priorityWeight;
//   final bool statusDelete;
//   final List<WordModel> words;

//   Topic({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.priorityWeight,
//     required this.statusDelete,
//     required this.words,
//   });

//   factory Topic.fromJson(Map<String, dynamic> json) {
//     print(json['words'].runtimeType);
//     List<WordModel> words = [];
//     if (json['words'] is List<dynamic>) {
//       final wordsJson = json['words'] as List;
//       words =
//           wordsJson.map((wordJson) => WordModel.fromJson(wordJson)).toList();
//     }

//     return Topic(
//       id: json['id'] as String,
//       image: json['image'] as String,
//       name: json['name'] as String,
//       priorityWeight: json['priorityWeight'] as int,
//       statusDelete: json['statusDelete'] as bool,
//       words: words,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'image': image,
//         'name': name,
//         'priorityWeight': priorityWeight,
//         'statusDelete': statusDelete,
//         'words': words.map((word) => word.toJson()).toList(),
//       };
// }

// class WordModel {
//   String id;
//   String name;
//   String definition;
//   String example;
//   String image;
//   String mean;
//   String pronounce;
//   String sound;
//   String type;

//   WordModel({
//     required this.id,
//     required this.name,
//     required this.definition,
//     required this.example,
//     required this.image,
//     required this.mean,
//     required this.pronounce,
//     required this.sound,
//     required this.type,
//   });

//   factory WordModel.fromJson(Map<String, dynamic> json) {
//     return WordModel(
//       id: json['_id'] ?? "",
//       name: json['name'] ?? "",
//       definition: json['definition'] ?? "",
//       example: json['example'] ?? "",
//       image: json['image'] ?? "",
//       mean: json['mean'] ?? "",
//       pronounce: json['pronounce'] ?? "",
//       sound: json['sound'] ?? "",
//       type: json['type'] ?? "",
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = id;
//     data['name'] = name;
//     data['definition'] = definition;
//     data['example'] = example;
//     data['image'] = image;
//     data['mean'] = mean;
//     data['pronounce'] = pronounce;
//     data['sound'] = sound;
//     data['type'] = type;
//     return data;
//   }
// }

// class FlipWordWidget extends StatelessWidget {
//   final WordModel word;

//   FlipWordWidget({required this.word});

//   @override
//   Widget build(BuildContext context) {
//     return FlipCard(
//       fill: Fill
//           .fillBack, // Fill the back side of the card to make in the same size as the front.
//       direction: FlipDirection.HORIZONTAL, // default
//       front: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Column(children: [
//           Padding(
//             padding: getPadding(all: 28),
//             child: CustomImageView(
//               imagePath: ImageConstant.wordBackground,
//               radius: BorderRadiusStyle.circleBorder5,
//             ),
//           ),
//           Container(
//             padding: getPadding(top: 32, left: 10, right: 10, bottom: 20),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: Text(word.name,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style:
//                                 AppStyle.txtRubikBold24.copyWith(fontSize: 24)),
//                       ),
//                       Text(word.type,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: AppStyle.txtRubikRegular14
//                               .copyWith(fontSize: 22)),
//                     ],
//                   ),
//                 ),
//                 /*3*/
//               ],
//             ),
//           ),
//         ]),
//       ),
//       back: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: getPadding(all: 10),
//           child: WordWidget(
//             word: word,
//           ),
//         )),
//       ),
//     );
//   }
// }

// class WordWidget extends StatelessWidget {
//   final WordModel word;

//   WordWidget({required this.word});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           word.name,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "(${word.type})",
//           style: TextStyle(
//             fontSize: 16,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         if (word.mean.isNotEmpty) ...[
//           SizedBox(height: 10),
//           Text('Meaning:',
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtRubikRegular18
//                   .copyWith(letterSpacing: getHorizontalSize(0.23))),
//           SizedBox(height: 2),
//           Text(word.mean,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtRubikBold24),
//         ],
//         SizedBox(height: 8),
//         if (word.definition.isNotEmpty) ...[
//           SizedBox(height: 10),
//           Text('Definition:',
//               // overflow: TextOverflow.ellipsis,
//               maxLines: 20,
//               // textAlign: TextAlign.,
//               style: AppStyle.txtRubikRegular18),
//           SizedBox(height: 2),
//           Text(word.definition,
//               // overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtRubikRegular18),
//         ],
//         if (word.example.isNotEmpty) ...[
//           SizedBox(height: 10),
//           Text('Example:',
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtRubikRegular18
//                   .copyWith(letterSpacing: getHorizontalSize(0.23))),
//           SizedBox(height: 8),
//           Text(
//             word.example,
//             style: TextStyle(
//               fontSize: 16,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }
