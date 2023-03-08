import 'package:bio_blog/paperPost.dart';
import 'package:bio_blog/theme.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: const Color(0x00000000),
      //   primarySwatch: Colors.green,
      //   textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      // ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  static const LabelStyle = TextStyle(
    color: AppColors.green,
    fontWeight: FontWeight.bold,
  );
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", AppColors.purple, labelStyle: LabelStyle),
    TabItem(Icons.menu_book, "Liked", AppColors.purple, labelStyle: LabelStyle),
    TabItem(Icons.person, "Profile", AppColors.purple, labelStyle: LabelStyle),
  ]);

  late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: PaperPost(
                          title:
                              "Biotech Goes Mainstream: The Intersection of Technology and Life Sciences",
                          imageURL:
                              "https://www.investopedia.com/thmb/KXicOWwvGUFXGQaQ1l6yE5Z0L5c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/biotechnology-research--female-scientist-mixing-a-chemical-formula-1023297106-f4b1a6296ed049f197b78eb7e185cfdb.jpg",
                          even: (index % 4 == 0),
                        ),
                      );
                    } else {
                      return const Divider(
                        height: 2.0,
                        color: Colors.white,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(tabItems,
                animationDuration: const Duration(milliseconds: 300),
                controller: _navigationController,
                normalIconColor: AppColors.green,
                selectedIconColor: AppColors.green,
                barBackgroundColor: AppColors.purple,
                selectedCallback: (int? selectedPos) {
              setState(() {
                this.selectedPos = selectedPos ?? 0;
                // print(_navigationController.value);
              });
            }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
