//player list

import 'package:flutter/material.dart';
import 'package:second_app/distinguished scientists_info.dart';

import 'main.dart';

class PersonsList extends StatefulWidget {
  final List<Person> persons;

  PersonsList({
    required this.persons,
  });

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  List<String> backgroundimage = [
    'assets/Alan Turing.jpg',
    'assets/Albert Einstein.jpeg',
    'assets/Charles Darwin.jpeg',
    'assets/Galileo Galilei.jpeg',
    'assets/Isaac Newton.jpeg',
    'assets/Louis Pasteur.jpg',
    'assets/Marie Curie.jpeg',
    'assets/Nikola Tesla.jpg',
    'assets/Stephen Hawking.jpg',
    'assets/Thomas Edison.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Persons '),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "assets/Isaac Newton.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        ListView.builder(
          itemCount: widget.persons.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(5),
              color: Colors.white38,
              child: ListTile(
                leading: Image.asset(widget.persons[index].image1),
                splashColor: Colors.pink[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                hoverColor: Colors.brown[300],
                title: Text(
                  widget.persons[index].name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonInformation(
                            player: widget.persons[index],
                          )));
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
