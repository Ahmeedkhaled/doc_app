import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/core/theming/styles.dart';
import 'package:task_doc/features/home/data/models/specialization_response_model.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  const DoctorSpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),

      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.lightBlue,
            child: SvgPicture.asset(
              "assets/svgs/general_speciality.svg",
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? "Specialization",
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
