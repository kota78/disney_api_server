import 'package:disney_api_client/disney_api_client.dart';
import 'package:disney_api_flutter/attraction_list_view.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  String? _resultMessage;
  String? _errorMessage;
  late Future<List<Attraction>?> onRefresh;

  @override
  void initState() {
    onRefresh = getAttractions();
    super.initState();
  }

  final _textEditingController = TextEditingController();

  // Calls the `hello` method of the `example` endpoint. Will set either the
  // `_resultMessage` or `_errorMessage` field, depending on if the call
  // is successful.

  void _callHello() async {
    try {
      final result = await client.example.hello(_textEditingController.text);
      setState(() {
        debugPrint(result);
        _resultMessage = result;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  void update() async {
    try {
      await client.attraction.updateAttractionData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Attraction>?> getAttractions() async {
    try {
      final result = await client.attraction.getAttractions();
      return result;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  addAttraction() async {
    var attraction = Attraction(
        name: 'スペースマウンテン',
        description: '開演当初からあります。',
        openingDate: DateTime.now());
    try {
      var result = await client.attraction.addAttraction(attraction);
      if (result) {
        setState(() {
          _resultMessage = 'Attraction inserted';
          _errorMessage = null;
        });
      }
    } on Exception catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 16.0),
            //   child: TextField(
            //     controller: _textEditingController,
            //     decoration: const InputDecoration(
            //       hintText: 'Enter your name',
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 16.0),
            //   child: ElevatedButton(
            //     onPressed: _callHello,
            //     child: const Text('Send to Server'),
            //   ),
            // ),
            // _ResultDisplay(
            //   resultMessage: _resultMessage,
            //   errorMessage: _errorMessage,
            // ),
            Expanded(
              child: FutureBuilder<List<Attraction>?>(
                  future: onRefresh,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Attraction>?> snapshot) {
                    if (snapshot.hasData) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            onRefresh = getAttractions();
                          });
                        },
                        child: AttractionList(attractions: snapshot.data!),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        update();
        setState(() {
          onRefresh = getAttractions();
        });
      }),
    );
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
