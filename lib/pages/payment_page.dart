import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 15,),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black, // Specify the desired color here
        ),
        title: const Text('Payment', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          _showAddCardModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCardModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Payment Method',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Card Number'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Expiry Date'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CVV'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel',style: TextStyle(color: Colors.black),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                      ),
                      onPressed: () {
                        // Implement save logic
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}