import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/views/screens/components/blog_card.dart';
import 'package:bootcamp_app/views/screens/create_update_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsListScreen extends ConsumerStatefulWidget {
  const BlogsListScreen({Key? key}) : super(key: key);

  @override
  _BlogsListScreenState createState() => _BlogsListScreenState();
}

class _BlogsListScreenState extends ConsumerState<BlogsListScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 1: Favorite',
        style: optionStyle,
      ),
      Text(
        'Index 2: Account',
        style: optionStyle,
      ),
    ];

    final blogsListState = ref.watch(blogsListProvider);
    final blogsList =
        blogsListState is BlogsListSuccessState ? blogsListState.blogsList : [];

    return Scaffold(
      appBar: AppBar(title: const Text('Blog App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const CreateUpdateBlogScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: blogsListState is BlogsListSuccessState
          ? ListView.builder(
              itemCount: blogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogCard(blogModel: blogsList[index]);
              },
            )
          : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
