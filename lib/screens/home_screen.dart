import 'package:flutter/material.dart';
import 'package:sdg_spark/screens/image_carousel.dart';
import 'package:sdg_spark/screens/sidebar_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDG Spark',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF117554),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllSDGs = false;

  final List<SDGItem> _sdgItems = [
    SDGItem(1, 'No Poverty', 'assets/sdg1.png'),
    SDGItem(2, 'Zero Hunger', 'assets/sdg2.png'),
    SDGItem(3, 'Good Health and Well-being', 'assets/sdg3.png'),
    SDGItem(4, 'Quality Education', 'assets/sdg4.png'),
    SDGItem(5, 'Gender Equality', 'assets/sdg5.png'),
    SDGItem(6, 'Clean Water and Sanitation', 'assets/sdg6.png'),
    SDGItem(7, 'Affordable and Clean Energy', 'assets/sdg7.png'),
    SDGItem(8, 'Decent Work and Economic Growth', 'assets/sdg8.png'),
    SDGItem(9, 'Industry, Innovation and Infrastructure', 'assets/sdg9.png'),
    SDGItem(10, 'Reduced Inequalities', 'assets/sdg10.png'),
    SDGItem(11, 'Sustainable Cities and Communities', 'assets/sdg11.png'),
    SDGItem(12, 'Responsible Consumption and Production', 'assets/sdg12.png'),
    SDGItem(13, 'Climate Action', 'assets/sdg13.png'),
    SDGItem(14, 'Life Below Water', 'assets/sdg14.png'),
    SDGItem(15, 'Life on Land', 'assets/sdg15.png'),
    SDGItem(16, 'Peace, Justice and Strong Institutions', 'assets/sdg16.png'),
    SDGItem(17, 'Partnerships for the Goals', 'assets/sdg17.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('SDG Spark', style: TextStyle(color: Color(0xFF117554))),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_pic.png'),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: const SidebarMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              const SizedBox(height: 24),
              const Text('SDGs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              SDGGrid(sdgItems: _showAllSDGs ? _sdgItems : _sdgItems.take(6).toList()),
              const SizedBox(height: 20),
              if (!_showAllSDGs)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showAllSDGs = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('See More',
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ImageCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
class SDGGrid extends StatelessWidget {
  final List<SDGItem> sdgItems;

  const SDGGrid({Key? key, required this.sdgItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: sdgItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (sdgItems[index].number == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SDG1DetailScreen(sdgItem: sdgItems[index]),
                ),
              );
            }
            // Add similar navigation for other SDGs as needed
          },
          child: Image.asset(
            sdgItems[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class SDGItem {
  final int number;
  final String name;
  final String imageUrl;

  SDGItem(this.number, this.name, this.imageUrl);
}

class SDG1DetailScreen extends StatelessWidget {
  final SDGItem sdgItem;

  const SDG1DetailScreen({Key? key, required this.sdgItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SDG ${sdgItem.number}: ${sdgItem.name}'),
        backgroundColor: const Color(0xFF117554),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 3,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            items: [
              'assets/detail_image1.jpg',
              'assets/detail_image2.jpg',
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROBLEM STATEMENT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  '• 24.5% of the population of Nepal lives below the poverty line.',
                ),
                Text(
                  '• Only 9.2% of the population in Finland lives below the poverty line.',
                ),
                Text(
                  '• Poverty hinders development and wellbeing for communities.',
                ),
                SizedBox(height: 20),
                Text(
                  'Explanation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('POVERTY IS A SERIOUS ISSUE THAT NEEDS TO BE ADDRESSED.'),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF117554),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Lesson', style: TextStyle(color: Colors.white,),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson'),
        backgroundColor: const Color(0xFF117554),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Poverty Data in Nepal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'In Nepal, many individuals and families live in poverty due to various factors such as lack of education, access to resources, and limited job opportunities.',
              style: TextStyle(fontSize: 16, color: Colors.black,),
            ),
            const SizedBox(height: 20),
            const Text(
              'Poverty Data Worldwide',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Globally, poverty is a persistent issue affecting millions, with disparities between countries highlighting the need for targeted solutions.',
              style: TextStyle(fontSize: 16,),
            ),
            const SizedBox(height: 20),
            const Text(
              'Solutions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Education and awareness programs.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '• Access to financial resources.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '• Community support initiatives.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF117554),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Take Quiz', style: TextStyle(color: Colors.white,),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What percentage of the population of Nepal lives below the poverty line?',
      'options': ['24.5%', '10%', '50%', '30%'],
      'correctAnswer': '24.5%',
    },
    {
      'question': 'According to the international poverty line, extreme poverty implies:',
      'options': [
        'Having no access to at least three meals a day',
        'Having no access to basic supplies',
        'Living on less than 1.90 USD a day',
      ],
      'correctAnswer': 'Living on less than 1.90 USD a day',
    },
    {
      'question': 'How many people are living below the international poverty line?',
      'options': ['100 million', '767 million', '1 billion'],
      'correctAnswer': '767 million',
    },
    {
      'question': 'Sustainable Development Goal 1 calls for the:',
      'options': [
        'Eradication of extreme poverty for all people everywhere by 2030',
        'Reduction of extreme poverty by half by 2030',
        'Reduction of poverty in general',
      ],
      'correctAnswer': 'Eradication of extreme poverty for all people everywhere by 2030',
    },
  ];

  void _checkAnswer() {
    if (_selectedAnswer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }
  }

  void _nextQuestion() {
    _checkAnswer();
    setState(() {
      _currentQuestionIndex++;
      _selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDG 1 Quiz',),
        centerTitle: true,
        backgroundColor: const Color(0xFF117554),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ..._questions[_currentQuestionIndex]['options'].map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedAnswer = option;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedAnswer == option
                              ? Colors.green
                              : const Color.fromARGB(255, 3, 116, 1),
                        ),
                        child: Text(option,
                        style: const TextStyle(color: Colors.white,),),
                      ),
                    );
                  }).toList(),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _selectedAnswer != null
                          ? _currentQuestionIndex < _questions.length - 1
                              ? _nextQuestion
                              : () {
                                  _checkAnswer();
                                  setState(() {
                                    _currentQuestionIndex++;
                                  });
                                }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF117554),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: Text(_currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Finish',
                      style: TextStyle(color: Colors.white,)),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Quiz Completed!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your Score: $_score / ${_questions.length}',
                    style: const TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProjectScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF117554),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('View Projects',
                  style: TextStyle(color: Colors.white,)),
                ),
                ]
            ),
        )
    ); 
  }
}

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Suggestions'),
        backgroundColor: const Color(0xFF117554),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Ideas for SDG 1',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '• Organize community workshops on poverty alleviation.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '• Develop a mentorship program for underprivileged youth.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '• Create a local food bank to support low-income families.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SDG13DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDG 13: Climate Action'),
        backgroundColor: const Color(0xFF117554),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PROBLEM STATEMENT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Climate change is causing extreme weather events globally.',
            ),
            const Text(
              '• Nepal is experiencing significant impacts from climate change.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Explanation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'CLIMATE ACTION IS ESSENTIAL TO MITIGATE THE IMPACTS OF CLIMATE CHANGE.',
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to a specific lesson or quiz for SDG 13
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 228, 228),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Lesson'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




