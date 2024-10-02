import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDPage extends StatefulWidget {
  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();

  Future<void> _create() async {
    try {
      await _firestore.collection('users').add({
        'name': _nameController.text,
      });
      print('User added');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _read() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      for (var doc in querySnapshot.docs) {
        print('User: ${doc['name']}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _update(String id) async {
    try {
      await _firestore.collection('users').doc(id).update({
        'name': 'Updated Name',
      });
      print('User updated');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _delete(String id) async {
    try {
      await _firestore.collection('users').doc(id).delete();
      print('User deleted');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Operations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _create, child: Text('Create')),
            ElevatedButton(onPressed: _read, child: Text('Read')),
          ],
        ),
      ),
    );
  }
}
