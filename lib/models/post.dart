class Post {
  final String title, text, imageUrl, date;
  final List<Map<String, dynamic>> links;
  final int postId;
  final bool shouldPinned;

  const Post({
    required this.title,
    required this.postId,
    required this.date,
    this.text = '',
    this.imageUrl = '',
    this.links = const [],
    this.shouldPinned = false,
  });
}

const List<Post> pinnedPosts = [
  Post(
    title: 'Tensorflow Summit',
    imageUrl: './assets/images/peer2all.png',
    postId: 101,
    date: '21/03/2014',
    shouldPinned: true,
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
  Post(
    title: 'Flutter Summit',
    links: [
      {
        'hint': 'bdu official website',
        'link': 'https://www.bud.student.info.com'
      }
    ],
    postId: 103,
    date: '21/03/2014',
    shouldPinned: true,
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
  Post(
    title: 'React Summit',
    links: [
      {
        'hint': 'watch the video',
        'link':
            'https://www.google.com/search?q=tensorflow+install+pip&oq=&aqs=chrome.0.35i39i362l8...8.1921420j0j1&sourceid=chrome&ie=UTF-8'
      }
    ],
    postId: 105,
    date: '21/03/2014',
    shouldPinned: true,
    text: '',
  ),
];

const List<Post> posts = [
  Post(
    title: 'Software Engineering Summit',
    imageUrl: './assets/images/peer2all.png',
    postId: 101,
    date: '21/03/2014',
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
  Post(
    title: 'Tensorflow Summit',
    imageUrl: './assets/images/peer2all.png',
    links: [
      {
        'hint': 'bdu official website',
        'link': 'https://www.bud.student.info.com'
      }
    ],
    postId: 101,
    date: '21/03/2014',
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
  Post(
    title: 'Flutter Summit',
    links: [
      {
        'hint': 'bdu official website',
        'link': 'https://www.bud.student.info.com'
      }
    ],
    postId: 103,
    date: '21/03/2014',
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
  Post(
    title: 'React Summit',
    links: [
      {
        'hint': 'watch the video',
        'link':
            'https://www.google.com/search?q=tensorflow+install+pip&oq=&aqs=chrome.0.35i39i362l8...8.1921420j0j1&sourceid=chrome&ie=UTF-8'
      },
      {
        'hint': 'bdu official website',
        'link': 'https://www.bud.student.info.com'
      },
    ],
    postId: 105,
    date: '21/03/2014',
    text:
        'Top-level module of TensorFlow. By convention, we refer to this module as `tf` instead of `tensorflow`, following the common practice of importingTensorFlow via the command `import tensorflow as tf`.The primary function of this module is to import all of the public TensorFlowinterfaces into a single place. The interfaces themselves are located insub-modules, as described below.imageUrl: ./assets/images/user.jpg',
  ),
];
