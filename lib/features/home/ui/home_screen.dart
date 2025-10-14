import 'package:flutter/material.dart';
import 'package:task_doc/core/helpers/spacing.dart';
import 'package:task_doc/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:task_doc/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:task_doc/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:task_doc/features/home/ui/widgets/doctors_list_view.dart';
import 'package:task_doc/features/home/ui/widgets/home_topbar.dart';
import 'package:task_doc/features/home/ui/widgets/specializations_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorSpecialitySeeAll(),
              verticalSpace(24),
              const SpecializationsAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
