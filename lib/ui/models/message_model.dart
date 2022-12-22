import 'package:face_off/ui/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/anon1.jpg',
);

// USERS
final User anon1 = User(
  id: 1,
  name: 'anon1',
  imageUrl: 'assets/images/anon1.jpg',
);
final User anon2 = User(
  id: 2,
  name: 'anon2',
  imageUrl: 'assets/images/anon2.jpg',
);
final User anon3 = User(
  id: 3,
  name: 'anon3',
  imageUrl: 'assets/images/anon3.jpg',
);
final User anon4 = User(
  id: 4,
  name: 'anon4',
  imageUrl: 'assets/images/anon4.jpg',
);
final User anon7 = User(
  id: 5,
  name: 'anon7',
  imageUrl: 'assets/images/anon7.jpg',
);
final User anon5 = User(
  id: 6,
  name: 'anon5',
  imageUrl: 'assets/images/anon5.jpg',
);
final User anon6 = User(
  id: 7,
  name: 'anon6',
  imageUrl: 'assets/images/anon6.jpg',
);

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: anon2,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: anon4,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: anon3,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: anon5,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: anon6,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: anon7,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: anon1,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: anon2,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    unread: true,
  ),
  Message(
    sender: anon2,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    unread: true,
  ),
  Message(
    sender: anon2,
    time: '3:15 PM',
    text: 'All the food',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    unread: true,
  ),
  Message(
    sender: anon2,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
];