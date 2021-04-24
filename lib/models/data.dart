import 'package:blog_responsive_app/models/customer.dart';

import 'video.dart';

const CustomUser currentUser = CustomUser(
  name: 'Code Warrior',
  profileImageUrl:
      'https://yt3.ggpht.com/yti/ANoDKi5FPLl_jZl-PHEg5XTsaGg2h_JCSaXRjRGErf36AQ=s88-c-k-c0x00ffffff-no-rj-mo',
  email: 'leoandrese.5@gmail.com',
  subscribers: '500k',
);
//Zaki@2021
const CustomUser lurn = CustomUser(
  name: 'Lurn',
  email: 'Lurn@gamil.com',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwnhIGPMzgkhOc6PjQSh-DOcjBq9yeu1-ObDHIzza=s176-c-k-c0x00ffffff-no-rj',
  subscribers: '444K',
);
const CustomUser shroud = CustomUser(
  name: 'Shroud',
  email: 'Shroud@gamil.com',
  subscribers: '6.75M',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwnhAtpHA0B2-10Xf0mDysSHFz6MI53IWjgsGCFAi1w=s176-c-k-c0x00ffffff-no-rj',
);
final List<Video> videos = [
  Video(
    id: 'Lv-t7dWBuLU',
    author: lurn,
    title: 'Lurn is The Real Female Shroud - PUBG #19',
    thumbnailUrl: 'https://i.ytimg.com/vi/Lv-t7dWBuLU/mqdefault.jpg',
    duration: '8:20',
    timestamp: DateTime(2019, 5, 22),
    viewCount: '1M',
    likes: '30187',
    dislikes: '1447',
  ),
  Video(
    id: 'AOc7vAOjGvc',
    author: shroud,
    title: 'THE KING OF PUBG',
    thumbnailUrl: 'https://i.ytimg.com/vi/AOc7vAOjGvc/mqdefault.jpg',
    duration: '11:29',
    timestamp: DateTime(2018, 03, 22),
    viewCount: '1.5M',
    likes: '77K',
    dislikes: '1447',
  ),
  Video(
    id: '2BHKshqoN60',
    author: shroud,
    title: 'Most Satisfying long range Sniping in Battlefield ASMR',
    thumbnailUrl: 'https://i.ytimg.com/vi/2BHKshqoN60/mqdefault.jpg',
    duration: '11:24',
    timestamp: DateTime(2016, 07, 02),
    viewCount: '6.5M',
    likes: '77K',
    dislikes: '2.5K',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
    thumbnailUrl: 'https://i.ytimg.com/vi/vrPk6LB9bjo/0.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Flutter Instagram Stories',
    thumbnailUrl: 'https://i.ytimg.com/vi/ilX5hnH8XoI/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];
