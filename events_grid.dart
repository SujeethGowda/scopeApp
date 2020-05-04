import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scopemobileapp/widgets/producer/eventsItem.dart';
import '../../providers/events.dart';

class EventsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventsData = Provider.of<Events>(context);
    final events = eventsData.events;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: events.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: events[i],
            child: EventItem(

                ),
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}