import 'package:flutter/material.dart';

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
      );
    } else {
      return Image.asset(
        'assets/Icons/home_outlined.png',
        scale: 2,
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
      );
    } else {
      return Image.asset(
        'assets/Icons/library_outlined.png',
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
    );
  }
}

class FullScreenIcon extends StatelessWidget {
  FullScreenIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // implement full screen function
      },
      child: Image.asset(
        'assets/Icons/full_screen.png',
        scale: 3,
      ),
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
    );
  }
}
class LikeIcon extends StatelessWidget {
  LikeIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/like.png',
      scale: 3,
    );
  }
}
class DislikeIcon extends StatelessWidget {
  DislikeIcon({
    super.key,
  });
  var state;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Icons/dislike.png',
      scale: 3,
    );
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
    );
  }
}