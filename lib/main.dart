import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/images/profile.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CachedNetworkImage(
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
                placeholder: (context, url) {
                  return const Image(
                    image: AssetImage(
                      "assets/images/placeholder.png",
                    ),
                  );
                },
                imageUrl:
                    "Network image URL here. But if its false, show error",
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset("assets/images/profile.jpg"),
                elevation: 100,
              ),
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              )
            ],
          ),
        )),
      ),
    );
  }
}
