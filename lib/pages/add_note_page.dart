import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../models/note_model.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Isi Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _saveNote(context),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNote(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: _titleController.text,
      content: _contentController.text,
      createdAt: DateTime.now(),
    );

    noteProvider.addNote(newNote);
    Navigator.pop(context);
  }
}
