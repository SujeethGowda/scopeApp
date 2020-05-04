import 'package:flutter/cupertino.dart';
import './event.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'dart:convert';



class Events with ChangeNotifier{
  List<Event> _events =[

  ];
  final String authToken;
  // final String userId;

  Events(this.authToken);

  List<Event> get events{
    return [..._events];
  }

  Future<void> fetchAndSetEvents() async{
    const url ='http://10.0.2.2:8080/event/events';
    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final event = extractedData['events'][0];
      print('please work');
      print(extractedData);
      if(extractedData == null){
        return;
      }
      final List<Event> loadedEvents =[];
      extractedData.forEach((eventData){
        loadedEvents.add(Event(
        id:eventData['_id'],
        title:eventData['titleOfTheEvent'],
        eventStartDate:eventData['startingDateOfTheEvent'],
        eventEndDate:eventData['endingDateOfTheEvent'],
        venue:eventData['industry'],
        industry:eventData['venue'],
        numberOfStalls:eventData['numberOfStalls'],
        contactNumber:eventData['stallBookingContactNumber'],
        description:eventData['description'],
        ticketSaleLink1:eventData['ticketSaleLink1'],
        ticketSaleLink2:eventData['ticketSaleLink2'],
        ticketSaleLink3:eventData['ticketSaleLink3'],
        facebookEventLink:eventData['facebookEventLink'],
        instagramEventLink:eventData['instagramEventLink'],
        
        ));
      });
      _events = loadedEvents;
      notifyListeners();
    }catch(error){
      print(error);
      throw(error);
    }
  }

  Future<void> addEvents(Event event) async{
    print(authToken);
    final url='http://10.0.2.2:8080/event/event';
    try{
      print(event.ticketSaleLink1);
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
        'titleOfTheEvent':event.title,
        'startingDateOfTheEvent':event.eventStartDate,
        'endingDateOfTheEvent':event.eventEndDate,
        'venue':event.venue,
        'industry':event.industry,
        'numberOfStalls':event.numberOfStalls,
        'stallBookingContactNumber':event.contactNumber,
        'description':event.description,
        'ticketSaleLink1':event.ticketSaleLink1,
        'ticketSaleLink2':event.ticketSaleLink2,
        'ticketSaleLink3':event.ticketSaleLink3,
        'eventLinkFacebook':event.facebookEventLink,
        'eventLinkInstagram':event.instagramEventLink,
        'token':authToken
        })
      );
    }
    catch(error){
      throw error;
    }
  }
}