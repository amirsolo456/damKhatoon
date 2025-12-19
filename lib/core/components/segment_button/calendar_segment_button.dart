import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentButton extends StatefulWidget {
  final Function onChange;
  final bool isSingleChoice;

  const SegmentButton({
    super.key,
    required this.onChange,
    required this.isSingleChoice,
  });

  @override
  State<SegmentButton> createState() => _SegmentButtonState();
}

class _SegmentButtonState extends State<SegmentButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              (widget.isSingleChoice
                  ? SingleChoice(onChange: widget.onChange)
                  : MultipleChoice(onChange: widget.onChange)),
              const SizedBox(height: 20),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  final Function onChange;

  const SingleChoice({super.key, required this.onChange});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();

  void onSelectionChange(Calendar calendar) {
    onChange(calendar);
  }
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('روزانه'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('هفتگی'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('ماهانه'),
          icon: Icon(Icons.calendar_view_month),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.year,
          label: Text('سالانه'),
          icon: Icon(Icons.calendar_today),
        ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          widget.onSelectionChange(newSelection.last);
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

class MultipleChoice extends StatefulWidget {
  final Function onChange;

  const MultipleChoice({super.key, required this.onChange});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();

  void onSelectionChange(List<Calendar> calendar) {
    onChange(calendar);
  }
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Calendar> selection = <Calendar>{Calendar.day, Calendar.month};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(value: Calendar.day, label: Text('روزانه')),
        ButtonSegment<Calendar>(value: Calendar.week, label: Text('هفتگی')),
        ButtonSegment<Calendar>(value: Calendar.month, label: Text('ماهانه')),
        ButtonSegment<Calendar>(value: Calendar.year, label: Text('سالانه')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          selection = newSelection;
          widget.onSelectionChange(newSelection.toList());
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
