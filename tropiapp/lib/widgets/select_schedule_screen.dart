import 'package:flutter/material.dart';
import 'package:date_time_picker_widget/date_time_picker_widget.dart';

class SelectSchedule extends StatelessWidget {
  const SelectSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dt = DateTime.now();
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date & Time Picker',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              'Date:   Time: ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 16),
            DateTimePicker(
              initialSelectedDate: dt,
              startDate: dt.subtract(const Duration(days: 1)),
              endDate: dt.add(const Duration(days: 60)),
              startTime: DateTime(dt.year, dt.month, dt.day, 6),
              endTime: DateTime(dt.year, dt.month, dt.day, 18),
              timeInterval: const Duration(minutes: 15),
              datePickerTitle: 'Pick your preferred date',
              timePickerTitle: 'Pick your preferred time',
              timeOutOfRangeError: 'Sorry shop is closed now',
              is24h: false,
              numberOfWeeksToDisplay: 4,
              onDateChanged: (date) {
                15;
              },
              onTimeChanged: (time) {
                15;
              },
            )
          ],
        ),
      ],
    );
  }
}
