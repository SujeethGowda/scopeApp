import 'dart:convert';

import 'package:flutter/material.dart';

class Event with ChangeNotifier{
  final String id;
  final String title;
  final String eventStartDate;
  final String eventEndDate;
  final String industry;
  final double numberOfStalls;
  final double contactNumber;
  final String venue;
  final String ticketSaleLink1;
  final String ticketSaleLink2;
  final String ticketSaleLink3;
  final String description;
  final String facebookEventLink;
  final String instagramEventLink;
  final String twitterEventLink;

  Event({
  @required this.id,
  @required this.title,
  @required this.eventStartDate,
  @required this.eventEndDate,
  @required this.venue,
  @required this.industry,
  @required this.numberOfStalls,
  @required this.contactNumber,
  @required this.description,
  @required this.ticketSaleLink1,
  this.ticketSaleLink2,
  this.ticketSaleLink3,
  this.facebookEventLink,
  this.instagramEventLink,
  this.twitterEventLink
});
}

