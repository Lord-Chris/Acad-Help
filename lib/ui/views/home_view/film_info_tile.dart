import 'package:acad_help/ui/constants/_constants.dart';
import 'package:acad_help/ui/shared/spacings.dart';
import 'package:flutter/material.dart';

import '../../../core/_core.dart';

class FilmInfoTile extends StatelessWidget {
  const FilmInfoTile({
    Key? key,
    this.info,
  }) : super(key: key);

  final FilmInfo? info;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: 120,
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(20)),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  "https://th.bing.com/th/id/OIP.r1_YMwOAwwb81UUFAl7MrAHaD4?w=315&h=180&c=7&r=0&o=5&pid=1.7",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const XMargin(20),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const YMargin(10),
                    Text(
                      "Title",
                      style: kMainStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Description",
                        style: kBodyStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Genre",
                          style: kBodyStyle,
                        ),
                        Text(
                          "Duration",
                          style: kBodyStyle,
                        ),
                      ],
                    ),
                    const YMargin(10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
