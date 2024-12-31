abstract class Quality {
  void prepare();
}

abstract class Video {
  final Quality quality;

  Video(this.quality);

  void play() {
    quality.prepare();
  }
}

class YoutubeVideo extends Video {
  final String url;

  YoutubeVideo({required Quality quality, required this.url}) : super(quality);

  @override
  void play() {
    super.play();
    print("Playing in YoutubeVideo: ${url}");
  }
}

class NetflixVideo extends Video {
  final String url;

  NetflixVideo({required Quality quality, required this.url}) : super(quality);

  @override
  void play() {
    super.play();
    print("Playing in NetflixVideo: ${url}");
  }
}

class HighQuality implements Quality {
  @override
  void prepare() {
    print("Preparing High Quality video");
  }
}

class LowQuality implements Quality {
  @override
  void prepare() {
    print("Preparing Low Quality video");
  }
}

void main() {
  final ytVideo =
      YoutubeVideo(quality: HighQuality(), url: "www.youtube.com/hfdofsdjifs");
  ytVideo.play();

  final nfVideo =
      NetflixVideo(quality: LowQuality(), url: "www.netflix.com/hfdofsdjifs");
  nfVideo.play();
}
