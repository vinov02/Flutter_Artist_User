import 'dart:convert';
import 'package:artist_community_user/Services/globals.dart';
import 'package:artist_community_user/components/carousel.dart';
import 'package:artist_community_user/components/exhibition_card.dart';
import 'package:artist_community_user/components/image_card.dart';
import 'package:artist_community_user/pages/notifation_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    _fetchPaintings();
  }
  List<String> assetImages = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];
  List<String> names = [
    'Landscape Nature',
    'Forest Mountains',
    'Brush Art',
    'Bridge Forest Way',
    'Brushes Painter',
  ];

  List<String> descriptions = [
    'captures the beauty of nature and the outdoors',
    'Mountain forests can be defined as forests on land',
    'A paintbrush is a brush used to apply paint or ink',
    'Structure that spans horizontally to allow pedestrians and vehicles to cross a void',
    'A paintbrush is usually made by clamping bristles to a handle with a ferrule.',
  ];

  List<String> places = [
    'Kochi',
    'Panampally Nagar',
    'Aluva',
    'Kalammassery',
    'Fort Kochi',
  ];

  List<double> prices = [150, 100, 299, 700, 350];

  void logout() async {
    String apiUrl = '$baseURL/user/logout';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept':'application/json'
          // Add any additional headers if required
        },
        // Add any request body if required
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } else {
        // Handle error response
        print('Logout failed: ${response.body}');
      }
    } catch (e) {
      // Handle network or server errors
      print('Error: $e');
    }
  }

  Future<List<Widget>> _fetchPaintings() async {
    final response = await http.get(Uri.parse('$baseURL/painting'));
    if (response.statusCode == 200) {
      final List<dynamic> paintingsData = json.decode(response.body)['painting'];
      return paintingsData.map<Widget>((paintingData) {
        double price = double.parse(paintingData['price']);
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailsPage(
                      imageUrl: 'http://192.168.29.243:8000${paintingData['image']}',
                      name: paintingData['name'],
                      description: paintingData['description'],
                      place: paintingData['place'],
                        price: price,
                    ),
                  ),
                );
              },
              child: Image.network(
                'http://192.168.29.243:8000${paintingData['image']}',
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image Load Failed');
                },
                width: 360, // Adjust the width as needed
                height: 320, // Adjust the height as needed
                fit: BoxFit.cover,
              ),

            ),
            ListTile(
              title: Text(paintingData['name'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4,),
                  Text(paintingData['description']),
                  const SizedBox(height: 4),
                  Text('Rs. ${paintingData['price']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14),
                      const SizedBox(width: 4),
                      Text('${paintingData['place']}'),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        );
      }).toList();
    } else {
      throw Exception('Failed to fetch paintings');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: const Text('Home Page', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
            color: Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              logout();
            },
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(),
               SizedBox(
                 height: 420,
                 child: FutureBuilder<List<Widget>>(
                  future: _fetchPaintings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return ListView(
                        children: snapshot.data!,
                      );
                    }
                  },
              ),
               ),

            //_buildHorizontalScrollImages(),
            const SizedBox(height: 20),
            const TopCarouselSection(),
            const SizedBox(height: 20),
            _buildBanner(),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exhibitions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            _buildExhibitionList(),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Meet Your New Art Advisor',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            _buildImageList(),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'New Works for You',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 140),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_outlined, size: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScrollImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailsPages(
                    imageUrl: assetImages[index % assetImages.length],
                    name: names[index % names.length],
                    description: descriptions[index % descriptions.length],
                    place: places[index % places.length],
                    price: prices[index % prices.length],
                  ),
                ),
              );
            },
            child: _buildImageCard(index),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(int index) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 250,
            color: Colors.grey,
            child: Image.asset(assetImages[index % assetImages.length], fit: BoxFit.fill),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                names[index % names.length],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  // Implement saving to wishlist functionality
                },
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
          Text(descriptions[index % descriptions.length]),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$${prices[index % prices.length]}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 10,
              ),
              Text(places[index % places.length]),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String place;
  final double price;

  const ImageDetailsPage({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.place,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18,),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black, // Specify the desired color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl, // Use the imageUrl passed from the previous page
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    place,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: \$${price.toString()}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                        ),
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Painting purchased successfully!'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              const CircularProgressIndicator();
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text(
                        'Buy Painting',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetailsPages extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String place;
  final double price;

  const ImageDetailsPages({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.place,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18,),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black, // Specify the desired color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    place,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: \$${price.toString()}',
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape:  const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                          )
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Painting purchased successfully!'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              const CircularProgressIndicator();
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('Buy Painting',style: TextStyle(
                          fontSize: 16
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Widget _buildBanner() {
  return Container(
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special Offer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Limited time offer! Get 20% off on selected items.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                // Implement button functionality
              },
              child: const Text(
                'Shop Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}

Widget _buildExhibitionList() {
  return SizedBox(
    width: double.infinity, // Match parent's width
    height: 220,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        ExhibitionCard(
          imageUrl:
          'https://images.hindustantimes.com/img/2021/03/06/1600x900/pjimage_-_2021-03-06T192427.069_1615038899966_1615038907778.jpg',
          name: 'Exhibition 1',
          place: 'Art Gallery',
          time: '10:00 AM - 6:00 PM',
        ),
        ExhibitionCard(
          imageUrl:
          'https://media.istockphoto.com/id/1218961153/photo/art-museum.jpg?s=612x612&w=0&k=20&c=9fK54fu1mjzFjDOSqg_jfrMy4Hkp8vsmImB7rLrbhJs=',
          name: 'Exhibition 2',
          place: 'Sculpture Museum',
          time: '9:00 AM - 5:00 PM',
        ),
        // Add more ExhibitionCard widgets as needed
      ],
    ),
  );
}

Widget _buildImageList() {
  return SizedBox(
    height: 430,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        ImageCard(
          imageUrl:
          'https://images.unsplash.com/photo-1608371945786-d47d3cdd31da?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGFydCUyMGdhbGxlcnl8ZW58MHx8MHx8fDA%3D',
          title: 'Find the art you love',
          description:
          'Discover the tools you need to collect artworks that fit your taste.',
        ),
        ImageCard(
          imageUrl:
          'https://img.freepik.com/premium-photo/full-length-portrait-creative-elegant-woman-looking-paintings-hanging-white-wall-while-visiting-modern-art-gallery-exhibition_236854-25783.jpg?w=2000',
          title: 'Free auction results',
          description:
          'Wondering what to bid? Check the Artispic Price Database for free art market data',
        ),
        ImageCard(
          imageUrl:
          'https://images.unsplash.com/photo-1608371945786-d47d3cdd31da?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGFydCUyMGdhbGxlcnl8ZW58MHx8MHx8fDA%3D',
          title: 'Know your collection better',
          description:
          "See all the artworks you own, on your phone and keep up with artist's markets.",
        ),
      ],
    ),
  );
}

