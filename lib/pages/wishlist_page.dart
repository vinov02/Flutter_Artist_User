import 'package:flutter/material.dart';

class Painting {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final String place;

  Painting({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.place,
  });
}

class WishList extends StatelessWidget {
  final List<Painting> paintings = [
    Painting(
      imageUrl: 'https://images7.alphacoders.com/133/1337829.png',
      title: 'Landscape Nature',
      description: 'captures the beauty of nature and the outdoors',
      price: 100,
      place: 'Kochi',
    ),
    Painting(
      imageUrl: 'https://images.unsplash.com/photo-1608371945786-d47d3cdd31da?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGFydCUyMGdhbGxlcnl8ZW58MHx8MHx8fDA%3D',
      title: 'Brush Art',
      description: 'Mountain forests can be defined as',
      price: 200,
      place: 'Fort Kochi',
    ),
  ];

   WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC527A),
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: paintings.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaintingDetailPage(painting: paintings[index]),
                ),
              );
            },
            child: PaintingCard(painting: paintings[index]),
          );
        },
      ),
    );
  }
}

class PaintingCard extends StatelessWidget {
  final Painting painting;

  const PaintingCard({
    Key? key,
    required this.painting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          painting.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(painting.title),
        subtitle: Text(painting.place),
        trailing: Text(
          '\$${painting.price}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PaintingDetailPage extends StatelessWidget {
  final Painting painting;

  const PaintingDetailPage({
    Key? key,
    required this.painting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18,),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black, // Specify the desired color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              painting.imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              painting.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              painting.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              painting.place,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${painting.price}',
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 45,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                  )
                ),
                  onPressed: (){
                    final snackBar = SnackBar(
                      content: const Text('Painting purchased successfully!'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {

                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Buy Now',)),
            )
          ],
        ),
      ),
    );
  }
}
