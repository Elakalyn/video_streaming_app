import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icon.png');
  }
}

class HomeIcon extends StatelessWidget {
  HomeIcon({
    super.key,
    this.state,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    if (state == 'selected') {
      return Image.asset(
        'assets/Icons/home_filled.png',
        scale: 2,
       color: darkThemeValue! ? Colors.white : Colors.black,
      );
    } else {
      return Image.asset(
        'assets/Icons/home_outlined.png',
        scale: 2,
        color: darkThemeValue! ? Colors.white : Colors.black,
      );
    }
  }
}

class LibraryIcon extends StatelessWidget {
  LibraryIcon({
    super.key,
    this.state,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    if (state == 'selected') {
      return Image.asset(
        'assets/Icons/library_filled.png',
        scale: 2,
        color: darkThemeValue! ? Colors.white : Colors.black,
      );
    } else {
      return Image.asset(
        'assets/Icons/library_outlined.png',
        color: darkThemeValue! ? Colors.white : Colors.black,
        scale: 2,
      );
    }
  }
}

class SettingsIcon extends StatelessWidget {
  SettingsIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/settings.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class SearchIcon extends StatelessWidget {
  SearchIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/search.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class PlaybackIcon extends StatelessWidget {
  PlaybackIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/playback.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class JumpIcon extends StatelessWidget {
  JumpIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/jump.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class PlaylistIcon extends StatelessWidget {
  PlaylistIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/playlist.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class DownIcon extends StatelessWidget {
  DownIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/down.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class AutoplayIcon extends StatelessWidget {
  AutoplayIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/autoplay.png',
      width: 34,
      height: 20,
    );
  }
}

class CastIcon extends StatelessWidget {
  CastIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/cast.png',
    );
  }
}

class SubtitleIcon extends StatelessWidget {
  SubtitleIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/subtitle.png',
      scale: 2,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class PauseIcon extends StatelessWidget {
  PauseIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/pause_icon.png',
      scale: 1.7,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class PlayIcon extends StatelessWidget {
  PlayIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/play.png',
      scale: 1.7,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class CloseIcon extends StatelessWidget {
  CloseIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/close.png',
      scale: 1.33,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class RewindIcon extends StatelessWidget {
  RewindIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/rewind.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class ForwardIcon extends StatelessWidget {
  ForwardIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/forward.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class LikeIcon extends StatelessWidget {
  LikeIcon({
    super.key,
    required this.liked,
  });
  var liked;
  @override
  Widget build(BuildContext context) {
    switch (liked) {
      case true:
        return Image.asset(
          'assets/Icons/like_filled.png',
          scale: 3,
          color: darkThemeValue! ? Colors.white : Colors.black,
        );

      default:
        return Image.asset(
          'assets/Icons/like.png',
          scale: 3,
          color: darkThemeValue! ? Colors.white : Colors.black,
        );
    }
  }
}

class DislikeIcon extends StatelessWidget {
  DislikeIcon({
    super.key,
    required this.disliked,
  });
  var disliked;
  @override
  Widget build(BuildContext context) {
    switch (disliked) {
      case true:
        return Image.asset(
          'assets/Icons/dislike_filled.png',
          scale: 3,
          color: darkThemeValue! ? Colors.white : Colors.black,
        );

      default:
        return Image.asset(
          'assets/Icons/dislike.png',
          scale: 3,
          color: darkThemeValue! ? Colors.white : Colors.black,
        );
    }
  }
}

class ShareIcon extends StatelessWidget {
  ShareIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/share.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class DownloadIcon extends StatelessWidget {
  DownloadIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/download.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class SaveIcon extends StatelessWidget {
  SaveIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/save.png',
      scale: 3,
      color: darkThemeValue! ? Colors.white : Colors.black,
    );
  }
}

class ProfileIcon extends StatelessWidget {
  ProfileIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.network('');
  }
}
