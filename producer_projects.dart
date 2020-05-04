import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scopemobileapp/providers/events.dart';
import 'package:scopemobileapp/widgets/producer/products_grid.dart';

class ProducerAllProjects extends StatefulWidget {
  static const routeName = '/producer-all-projects';
  @override
  _ProducerAllProjectsState createState() => _ProducerAllProjectsState();
}

class _ProducerAllProjectsState extends State<ProducerAllProjects>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<Events>(context).fetchAndSetEvents().then((_){
        setState(() {
          _isLoading=false;
        });
      });
    }
    _isInit=false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projects'),),
      body: _isLoading ? Center(child: CircularProgressIndicator(),):EventsGrid()
    );
  }
}