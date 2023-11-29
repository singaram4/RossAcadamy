import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// ... Your imports and other code ...

// ... Your imports and other code ...

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Feminine Health',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement your search functionality here
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('Obulama Eats', SubCategoryScreen('Obulama Eats', obulamaEatsCategories), Colors.teal),
                CustomButton('HedhiHelp', SubCategoryScreen('HedhiHelp', hedhiHelpCategories), Colors.orange),
                CustomButton('SengaSafe', SubCategoryScreen('SengaSafe', sengaSafeCategories), Colors.red),
                CustomButton('Omuwala Power', SubCategoryScreen('Omuwala Power', omuwalaPowerCategories), Colors.purple),
                CustomButton('OmwanaThrive', SubCategoryScreen('OmwanaThrive', omwanaThriveCategories), Colors.green),
              ],
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/Womenhealth.jpeg',
              height: 450,
              width: 400,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/scu.jpg',
                        height: 75,
                        width: 75,
                      ),
                      SizedBox(width: 16),  // Adjust the width as needed
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Frugal Innovation Club',
                            style: TextStyle(color: Colors.blue),  // Adjust the color as needed
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Santa Clara University',
                            style: TextStyle(color: Colors.red),  // Adjust the color as needed
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),  // Adjust the width as needed
                Image.asset(
                  'assets/ross.jpg',
                  height: 75,
                  width: 75,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ... Your other classes and data ...


// ... Your other classes and data ...


class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget destination;
  final Color color;

  CustomButton(this.buttonText, this.destination, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ObulamaEatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubCategoryScreen('Obulama Eats', obulamaEatsCategories);
  }
}

class SubCategoryScreen extends StatelessWidget {
  final String title;
  final Map<String, List<String>> categoryImageMap;

  SubCategoryScreen(this.title, this.categoryImageMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: categoryImageMap.keys.map((category) {
            return buildCategoryButton(context, category, categoryImageMap[category]!);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildCategoryButton(BuildContext context, String category, List<String> images) {
    return Card(
      elevation: 4,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageSliderScreen(category, images),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          category,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ImageSliderScreen extends StatelessWidget {
  final String title;
  final List<String> imagePaths;

  ImageSliderScreen(this.title, this.imagePaths);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ImageSlider(imagePaths),
    );
  }
}

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;

  ImageSlider(this.imagePaths);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleImageView(widget.imagePaths[index]),
              ),
            );
          },
          child: Image.asset(
            widget.imagePaths[index],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class SingleImageView extends StatelessWidget {
  final String imagePath;

  SingleImageView(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// Sample data for categories and images
Map<String, List<String>> obulamaEatsCategories = {
  'Teens': [
    'assets/Slide 3 - Teens.png',
    'assets/Slide 4 - Teens.png',
    'assets/Slide 5 - Teens.png',
  ],
  'Adults': [
    'assets/Slide 6 - Adults.png',
    'assets/Slide 7 - Adults.png',
    'assets/Slide 8 - Adults.png',
    'assets/Slide 9 - Adults.png',
    'assets/Slide 10 - Adults.png',
    'assets/Slide 11 - Adults.png',
    'assets/Slide 12 - Adults.png',
    'assets/Slide 13 - Adults.png',
  ],
  'Pregnancy': [
    'assets/Slide 14 - Pregnancy.png',
    'assets/Slide 15 - Pregnancy.png',
    'assets/Slide 16 - Pregnancy.png',
    'assets/Slide 17 - Pregnancy.png',
    'assets/Slide 18 - Pregnancy.png',
    'assets/Slide 19 - Pregnancy.png',
    'assets/Slide 20 - Pregnancy.png',
    'assets/Slide 21 - Pregnancy.png',
  ],
  'Infants': [
    'assets/Slide 22 - Infants.png',
    'assets/Slide 23 - Infants.png',
    'assets/Slide 24 - Infants.png',
    'assets/Slide 25 - Infants.png',
    'assets/Slide 26 - Infants.png',
    'assets/Slide 27 - Infants.png',
    'assets/Slide 28 - Infants.png',
    'assets/Slide 27 - Infants.png',
    'assets/Slide 28 - Infants.png',
  ],
  'Children': [
    'assets/Slide 29 - Children.png',
    'assets/Slide 30 - Children.png',
    'assets/Slide 31 - Children.png',
    'assets/Slide 32 - Children.png',
    'assets/Slide 33 - Children.png',
  ],
  'Food Guides': [
    'assets/Slide 34 - Food Guides.png',
    'assets/Slide 35 - Food Guides_b.png',
    'assets/Slide 36 - Food Guides_b.png',
    'assets/Slide 37 - Food Guides_b.png',
    'assets/Slide 38 - Food Guides_b.png',
  ],
};

Map<String, List<String>> hedhiHelpCategories = {
  // Add HedhiHelp categories and images here
};

Map<String, List<String>> sengaSafeCategories = {
  // Add SengaSafe categories and images here
};

Map<String, List<String>> omuwalaPowerCategories = {
  // Add Omuwala Power categories and images here
};

Map<String, List<String>> omwanaThriveCategories = {
  // Add OmwanaThrive categories and images here
};
