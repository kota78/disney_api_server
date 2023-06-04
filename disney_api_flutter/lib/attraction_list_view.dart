import 'package:disney_api_client/disney_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttractionList extends ConsumerStatefulWidget {
  final List<Attraction> attractions;
  const AttractionList({
    Key? key,
    required this.attractions,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AttractionListState();
}

class _AttractionListState extends ConsumerState<AttractionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.attractions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(widget.attractions[index].name),
        );
      },
    );
  }
}
