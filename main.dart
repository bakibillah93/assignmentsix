import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageUrls = [
    'https://picsum.photos/200/300.jpg',
    'https://picsum.photos/200/301.jpg',
    'https://picsum.photos/200/302.jpg',
    'https://picsum.photos/200/303.jpg',
    'https://picsum.photos/200/304.jpg',
    'https://picsum.photos/200/305.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to our Photo Gallery!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search for photos...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Image ${index + 1} clicked!'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Photo ${index + 1}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200/306.jpg'),
              ),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle for Sample Photo 1'),
            ),

            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200/307.jpg'),
              ),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle for Sample Photo 1'),
            ),

            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200/308.jpg'),
              ),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle for Sample Photo 1'),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Text('Upload Photos'),
            ),
          ],
        ),
      ),
    );
  }
}
