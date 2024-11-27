import 'package:chatter/models/models.dart';
import 'package:chatter/screens/screens.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
// Alias for faker package
import 'package:flutter/widgets.dart' as flutter;  // Alias for flutter package


import '../helpers.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // You can uncomment _Stories() if you want to add it back later
        // const SliverToBoxAdapter(
        //   child: _Stories(),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _delegate,
            childCount: 2, // Number of messages to display
          ),
        ),
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    
    // Define the array of sender names
    final List<String> senderNames = [
      "Rey Mahendra", 
      "CS Chatter", 
    ];
    
    // Get the sender name based on the index (modulo to cycle through if index is larger than the array size)
    String senderName = senderNames[index % senderNames.length];
    
    return _MessageTitle(
      messageData: MessageData(
        senderName: senderName, // Sender name comes from the array
        message: faker.lorem.sentence(),
        messageDate: date,
        dateMessage: Jiffy.parseFromDateTime(date).fromNow(),
        profilePicture: Helpers.randomPictureUrl(),
      ),
    );
  }
}


class _MessageTitle extends StatelessWidget {
  const _MessageTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
             Padding(
              padding: const EdgeInsets.all(10.0),  // Adds padding of 10.0 units on all sides
              child: ClipRRect(  // Clips the child widget with rounded corners
                borderRadius: BorderRadius.circular(50.0),  // Circular border radius to make it rounded
                child: flutter.Image.asset(  // Using the alias 'flutter' for the 'Image' from the Flutter package
                  messageData.profilePicture,  // Path to your local image or URL
                  width: 35.0,  // Adjust the size as needed
                  height: 35.0, // Adjust the size as needed
                  fit: BoxFit.cover,  // Ensures the image covers the entire rounded area
                ),
              ),
            ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),  
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



