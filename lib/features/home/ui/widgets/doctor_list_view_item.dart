import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/core/theming/styles.dart';
import 'package:task_doc/features/home/data/models/specialization_response_model.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorListViewItem({super.key, required this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              width: 110.w,
              height: 120.h,
              fit: BoxFit.cover,
              imageUrl:
                  'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
              placeholder: (context, url) => Container(
                width: 110.w,
                height: 120.h,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: 110.w,
                height: 120.h,
                color: Colors.grey[300],
                child: const Icon(Icons.error),
              ),
            ),
            // Image.network(
            //   width: 110.w,
            //   height: 120.h,
            //   'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
            //   fit: BoxFit.cover,
            // ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? "Doctor Name",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  "${doctorsModel?.degree} | ${doctorsModel?.phone}",
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorsModel?.email ?? "excample@gmail.com",
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
