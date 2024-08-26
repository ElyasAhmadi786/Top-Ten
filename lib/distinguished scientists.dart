//Detail page

import 'package:flutter/material.dart';
import 'package:second_app/distinguished scientists_info.dart';

import 'distinguished scientists_list.dart';
import 'main.dart';

class DetailPage extends StatefulWidget {
  final Ds ds;

  DetailPage({required this.ds});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //list of football players
  @override
  Widget build(BuildContext context) {
    final List<Person> persons = widget.ds.name == "Alan Turing"
        ? alanTuringPersons
        : widget.ds.name == 'Albert Einstein'
            ? albertEinsteinPersons
            : widget.ds.name == 'Charles Darwin'
                ? charlesDarwinPersons
                : widget.ds.name == 'Galileo Galilei'
                    ? galileoGalileiPersons
                    : widget.ds.name == 'Isaac Newton'
                        ? isaacNewtonPersons
                        : widget.ds.name == 'Louis Pasteur'
                            ? louisPasteurPersons
                            : widget.ds.name == 'Marie Curie'
                                ? marieCuriePersons
                                : widget.ds.name == 'Nikola Tesla'
                                    ? nikolaTeslaPersons
                                    : widget.ds.name == 'Stephen Edison'
                                        ? stephenHawkingPersons
                                        : thomasEdisonPersons;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ds.name),
        backgroundColor: Colors.purpleAccent[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.all(8),
          color: Colors.purple[100],
          child: Column(
            children: [
              Container(
                  height: 400,
                  width: double.infinity,
                  //color: Colors.purple[100],
                  child: Text(widget.ds.moredetails)),
              Container(
                height: 350,
                width: double.infinity,
                child: Image.asset(
                  widget.ds.image,
                  fit: BoxFit.cover,
                  width: 250,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Text(
                      'Top 5 Persons of ${widget.ds.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonsList(
                          persons: persons,
                        ),
                      ));
                    },
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Game of the  ${widget.ds.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      onPressed: () {
                        launchURL(widget.ds.gamelink);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
