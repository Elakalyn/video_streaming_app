import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class MiniVideoCard extends StatelessWidget {
  const MiniVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: HexColor('272727'),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 3,
                  width: 140,
                  decoration: BoxDecoration(
                  color: HexColor('7D7D7D'),

                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 3,
                      width: 30,
                       decoration: BoxDecoration(
                  color: Colors.red,

                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))
                  ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: HexColor('0F0F0F').withOpacity(.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '12:40',
                      style: TextStyles.tinyDetails,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        6.h,
        Text('Mini Video', style: TextStyles.title),
        Text('18 watched', style: TextStyles.videoDetails)
      ],
    );
  }
}
