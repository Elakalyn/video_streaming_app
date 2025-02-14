import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: darkThemeValue! ? Colors.grey[850] : HexColor('ECECEC'),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search YouTube',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class previousSearchItem extends StatelessWidget {
  const previousSearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        child: Row(
          children: [
            PlaybackIcon(),
            24.w,
            Text(
              'Previous search example',
              style: TextStyles.previousSearch,
            ),
            Spacer(),
            JumpIcon(),
          ],
        ),
      ),
    );
  }
}

class previousSearchesList extends StatelessWidget {
  const previousSearchesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 18,
      separatorBuilder: (context, index) => 12.h,
      itemBuilder: (BuildContext context, int index) {
        return previousSearchItem();
      },
    );
  }
}

class searchResulltsList extends StatelessWidget {
  const searchResulltsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        // return VideoCard();
      },
    );
  }
}
