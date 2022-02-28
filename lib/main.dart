import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Select the number',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  String answerText = 'Answer will be shown here.';
  int score = 0;
  int ans = 1;
  var threeImg = [];
  var imgNo1 = 1;
  var imgNo2 = 2;
  var imgNo3 = 3;

  Color color = Colors.black;

  void shaffule() {
    imageNumbers.shuffle();
  }

  void getThreeImg() {
    imgNo1 = imageNumbers[0];
    imgNo2 = imageNumbers[1];
    imgNo3 = imageNumbers[2];
    threeImg = [imgNo1, imgNo2, imgNo3];
  }

// shaffule three images
  void threeShaffule() {
    threeImg.shuffle();
    ans = threeImg[0];
  }

  void checkAnswer(int imageNo) {
    if (ans == imageNo) {
      setState(() {
        answerText = 'Correct';
        color = Colors.green;
        score += 10;
      });
    } else {
      setState(() {
        answerText = 'Incorrect';
        color = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select the number')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Press the Number: $ans',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    checkAnswer(imgNo1);
                  },
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$imgNo1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    checkAnswer(imgNo2);
                  },
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$imgNo2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    checkAnswer(imgNo3);
                  },
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$imgNo3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              answerText,
              style: TextStyle(
                  color: color, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      imageNumbers.shuffle();
                      getThreeImg();
                      threeShaffule();
                    });
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Score:$score',
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
