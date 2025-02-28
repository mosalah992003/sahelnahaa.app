import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class TimelineCalendar extends StatelessWidget {
  const TimelineCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      headerProps: const EasyHeaderProps(
        showHeader: false,
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: EasyDayProps(
        inactiveDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontFamily: "noto",
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.6)),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayNumStyle: const TextStyle(
            color: Colors.white, // Only the color is different
            fontFamily: "noto",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff215F56),
                Color(0xff207768),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
