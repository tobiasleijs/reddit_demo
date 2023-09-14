import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';
import 'package:reddit_app/utils/go_router.dart';

class PostCreation extends StatefulWidget {
  const PostCreation({super.key});

  @override
  State<PostCreation> createState() => _PostCreationState();
}

class _PostCreationState extends State<PostCreation> {
  final PersistencePort database = PersistenceAdapter();

  late String title;

  late String body;

  late String subreddit = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create post'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 61, 61),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    )),
                const SizedBox(height: 5.0),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      title = newValue;
                    }
                  },
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text('Body',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 300.0,
                  child: TextFormField(
                      onSaved: (newValue) {
                        if (newValue != null) {
                          body = newValue;
                        }
                      },
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        enabledBorder: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid body';
                        }
                        return null;
                      }),
                ),
                const SizedBox(height: 20),
                const Text('Post to',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0)),
                const SizedBox(height: 5.0),
                DropdownButtonFormField<String>(
                  value: database.getSubredditNames()[0],
                  hint: const Text('Subreddit'),
                  onChanged: (value) {
                    setState(() {
                      subreddit = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Subreddit required';
                    return null;
                  },
                  items: database
                      .getSubredditNames()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF499167),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        database.savePost(PostModel(
                            title: title,
                            body: body,
                            subreddit: subreddit,
                            id: 1,
                            authorId: 4));
                        context.goNamed(RouteNames.home);
                      }
                    },
                    child: const Text('Post')),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}