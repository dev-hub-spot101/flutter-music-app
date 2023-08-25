class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({required this.title,required this.description,required this.url,required this.coverUrl});

  static List<Song> songs = [
    Song(title: "Love Dove", description: "Dove Love", url: "assets/music/1.mp3", coverUrl: "assets/images/glass.jpg"),
    Song(title: "Illusions", description: "Illusions", url: "assets/music/2.mp3", coverUrl: "assets/images/illusions.jpg"),
    Song(title: "Motivation", description: "Motivation", url: "assets/music/3.mp3", coverUrl: "assets/images/pray.jpg")
  ];
}