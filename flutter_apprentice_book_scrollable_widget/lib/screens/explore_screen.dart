import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreSreen extends StatefulWidget {
  const ExploreSreen({Key? key}) : super(key: key);

  @override
  State<ExploreSreen> createState() => _ExploreSreenState();
}

class _ExploreSreenState extends State<ExploreSreen> {
  final mockService = MockFooderlichService();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  // The way that the book coded the challenge
  // _controller.offset >= _controller.position.maxScrollExtent &&
  // !_controller.position.outOfRange
  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      final isTop = _scrollController.position.pixels == 0;
      final isBottom = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      if (isTop) {
        print('i am at the top!');
      }
      if (isBottom) {
        print('i am at the bottom!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          final friends = snapshot.data?.friendPosts ?? [];
          return ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipesListView(recipes: recipes),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: friends),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
