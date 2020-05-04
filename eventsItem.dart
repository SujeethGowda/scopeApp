import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scopemobileapp/providers/event.dart';
import 'package:scopemobileapp/screens/producer/event_details_screen.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl='https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
    final event = Provider.of<Event>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              EventDetailsScreen.routeName,
              arguments: event.id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            event.title,
            textAlign: TextAlign.center,
          ),
          trailing: Text(event.eventStartDate),
        ),
      ),
    );
  }
}