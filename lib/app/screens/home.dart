import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgtes/global_widgets.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: GlobalWidgets.customAppBar('SYNRGG'),
          body: Column(
            children: [
              // Search Bar
              GlobalWidgets.searchBar(
                onSearch: (query) => controller.searchQuery.value = query,
              ),
              Expanded(
                child: Obx(() {
                  // Render filtered posts dynamically
                  return ListView.builder(
                    itemCount: controller.filteredPosts.length,
                    itemBuilder: (context, index) {
                      final post = controller.filteredPosts[index];
                      return GlobalWidgets.postCard(
                        communityName: post['communityName'],
                        postTitle: post['postTitle'],
                        description: post['description'],
                        isImagePost: post['isImagePost'],
                        likes: post['likes'].value,
                        comments: post['comments'].value,
                        onLike: () => controller.likePost(index),
                        onComment: () => controller.addComment(index),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          bottomNavigationBar: Obx(
                () => GlobalWidgets.customBottomNavigationBar(
              selectedIndex: controller.selectedIndex.value,
              onTap: (index) => controller.changeTab(index),
            ),
          ),
        );
      },
    );
  }
}