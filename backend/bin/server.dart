// import 'package:server/server.dart' as server;

// void main(List<String> arguments) {
//   print('Hello world: ${server.calculate()}!');
// }

import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

// Create Router
final router =
    Router()
      ..get('/', (Request request) => Response.ok('Welcome to OneNet Backend'))
      ..get('/user/<id>', (Request request, String id) {
        return Response.ok('User ID: $id');
      });

// Entry point
void main() async {
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('✅ Server started at http://${server.address.host}:${server.port}');
}





// Code to connect to Firestore and fetch data

// Should only be used after setting up Firebase Admin SDK

// import 'dart:io';
// import 'package:dotenv/dotenv.dart' as dotenv;
// import 'package:firebase_admin/firebase_admin.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:shelf_router/shelf_router.dart';

// late Firestore firestore;  // Firestore instance globally available

// Future<void> main() async {
//   dotenv.load();
//   final port = int.tryParse(dotenv.env['PORT'] ?? '8080') ?? 8080;

//   // Initialize Firebase Admin
//   final app = FirebaseAdmin.instance.initializeApp(AppOptions(
//     credential: FirebaseCredential.fromPath(dotenv.env['FIREBASE_SERVICE_ACCOUNT']!),
//   ));

//   firestore = app.firestore();  // Initialize Firestore

//   final router = Router()
//     ..get('/', (Request request) => Response.ok('Welcome to OneNet Backend'))
//     ..get('/users', getAllUsers);

//   final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

//   final server = await io.serve(handler, InternetAddress.anyIPv4, port);
//   print('✅ Server running at http://${server.address.host}:$port');
// }

// // Example handler to fetch all users from Firestore
// Future<Response> getAllUsers(Request request) async {
//   final usersCollection = firestore.collection('users');
//   final snapshot = await usersCollection.get();

//   final users = snapshot.docs.map((doc) => doc.data).toList();

//   return Response.ok(
//     users.toString(),
//     headers: {'Content-Type': 'application/json'},
//   );
// }

