import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../data/models/community_model.dart';

class CommunityRecipeUser extends StatelessWidget {
  const CommunityRecipeUser({
    super.key,
    required this.model,
    required this.created,
  });

  final CommunityModel model;
  final String created;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: CachedNetworkImage(
            imageUrl: model.user.profilePhoto,
            fit: BoxFit.cover,
            height: 46,
            width: 46,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  strokeWidth: 2,
                ),
              );
            },
            errorWidget: (context, url, error) =>
                Icon(Icons.person, size: 46, color: Colors.grey),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@${model.user.username}",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              maxLines: 1,
            ),
            Text(
              created,
              style: TextStyle(
                color: AppColors.pinkSub,
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              maxLines: 1,
            ),
          ],
        )
      ],
    );
  }
}
