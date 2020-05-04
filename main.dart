import 'package:flutter/material.dart';
import 'package:scopemobileapp/secret_pin_screen.dart';
import './categories_screen.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './all_live_events.dart';
import './screens/producer/producer_event_queries_page.dart';
import './screens/spectator/spectator_events_highlights.dart';
import './screens/spectator/spectator_queries.dart';
import './screens/spectator/spectator_saved_business_cards.dart';
import './screens/spectator/spectator_settings_page.dart';
import './screens/spectator/spectator_upcoming_events.dart';
import './screens/exhibitor/exhibitor_my_events.dart';
import './screens/exhibitor/exhibitor_my_highlights.dart';
import './screens/exhibitor/exhibitor_my_projects.dart';
import './screens/exhibitor/exhibitor_recieved_business_card.dart';
import './screens/producer/producer_highlights.dart';
import './screens/producer/producer_projects.dart';
import './screens/producer/create_event.dart';
import './screens/producer/producer_my_event.dart';
import './screens/producer_dashboard.dart';
import './screens/spectator/create_business_card.dart';
import './screens/spectator_dashboard.dart';
import './screens/exhibitor_dashboard.dart';
import './screens/exhibitor_signup_screen.dart';
import './screens/producer_signup_screen.dart';
import './producer_sign_screen.dart';
import './auth_screen.dart';
import './providers/producercompany.dart';
import './providers/events.dart';
import './providers/exhibitorcompany.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Company>(
            update: (_, auth, company) => Company(auth.token)),
        ChangeNotifierProxyProvider<Auth, Events>(
          update: (_,auth, event)=>Events(auth.token)),
        ChangeNotifierProxyProvider<Auth, ExhibitorCompany>(
          update: ( _,auth,exhibitorCompany)=>ExhibitorCompany(auth.token)
        )
      ],
      child: Consumer<Auth>(
          builder: (ctx, authData, _) => MaterialApp(
                title: 'Scope',
                theme: ThemeData(
                  primarySwatch: Colors.purple,
                  accentColor: Colors.purple,
                  canvasColor: Color.fromRGBO(255, 254, 229, 1),
                  fontFamily: 'Raleway',
                  textTheme: ThemeData.light().textTheme.copyWith(
                      body1: TextStyle(
                        color: Color.fromRGBO(20, 51, 51, 1),
                      ),
                      body2: TextStyle(
                        color: Color.fromRGBO(20, 51, 51, 1),
                      ),
                      title: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      )),
                ),

                home: authData.isAuth ? CategoriesScreen() : AuthScreen(),
                // initialRoute: '/', // default is '/'s
                routes: {
                  // '/': (ctx) => CategoriesScreen(),
                  CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
                  ProducerSignUpScreen.routeName: (ctx) =>
                      ProducerSignUpScreen(),
                  ExhibitorSignUpScreen.routeName: (ctx) =>
                      ExhibitorSignUpScreen(),
                  ExhibitorDashbord.routeName: (ctx) => ExhibitorDashbord(),
                  ProducerDashbord.routeName: (ctx) => ProducerDashbord(),
                  SpectatorDashbord.routeName: (ctx) => SpectatorDashbord(),
                  CreateBusinessCard.routeName: (ctx) => CreateBusinessCard(),
                  CreateEvent.routeName: (ctx) => CreateEvent(),
                  ProducerMyEventDisplay.routeName: (ctx) =>
                      ProducerMyEventDisplay(),
                  AllLiveEventsShowing.routeName: (ctx) =>
                      AllLiveEventsShowing(),
                  ProducerAllProjects.routeName: (ctx) => ProducerAllProjects(),
                  ProducerEventsHighlights.routeName: (ctx) =>
                      ProducerEventsHighlights(),
                  ExhibitorMyEvents.routeName: (ctx) => ExhibitorMyEvents(),
                  ExhibitorMyProjects.routeName: (ctx) => ExhibitorMyProjects(),
                  ExhibitorMyHighlights.routeName: (ctx) =>
                      ExhibitorMyHighlights(),
                  ExhibitorReceivedBusinessCards.routeName: (ctx) =>
                      ExhibitorReceivedBusinessCards(),
                  ExhibitorUpcomingEvents.routeName: (ctx) =>
                      ExhibitorUpcomingEvents(),
                  SpectatorSavedBusinessCards.routeName: (ctx) =>
                      SpectatorSavedBusinessCards(),
                  SpectatorEventsHighlights.routeName: (ctx) =>
                      SpectatorEventsHighlights(),
                  SpectatorQueriesPage.routeName: (ctx) =>
                      SpectatorQueriesPage(),
                  SpectatorSettingsPage.routeName: (ctx) =>
                      SpectatorSettingsPage(),
                  ProducerEventQueriesPage.routeName: (ctx) =>
                      ProducerEventQueriesPage(),
                  SecretPinScreen.routeName: (ctx) => SecretPinScreen(),
                },
              )),
    );
  }
}
