import 'package:flutter/material.dart';

import 'package:task_doc/features/home/data/models/specialization_response_model.dart';
import 'package:task_doc/features/home/ui/widgets/doctor_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?> doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return DoctorListViewItem(doctorsModel: doctorsList[index]);
        },
      ),
    );
  }
}
