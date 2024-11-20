import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectedIndex = 0.obs; // For bottom navigation
  var searchQuery = ''.obs; // Search query
  var posts = <Map<String, dynamic>>[].obs; // Original list of posts
  var filteredPosts = <Map<String, dynamic>>[].obs; // Filtered posts for search

  @override
  void onInit() {
    super.onInit();

    // Initialize posts
    posts.assignAll([
      {
        'communityName': 'Valorant Community',
        'postTitle': 'Game Update!',
        'description': 'New agent "Deadlock" revealed. What are your thoughts?',
        'isImagePost': false,
        'likes': 10.obs,
        'comments': 5.obs,
      },
      {
        'communityName': 'Fortnite Updates',
        'postTitle': 'Image Post',
        'description': '',
        'isImagePost': true,
        'likes': 25.obs,
        'comments': 15.obs,
      },
      {
        'communityName': 'CS:GO Fans',
        'postTitle': 'Text Post',
        'description': 'Did you hear about the new CS2 mechanics?',
        'isImagePost': false,
        'likes': 40.obs,
        'comments': 20.obs,
      },
      {
        'communityName': 'Minecraft Builders',
        'postTitle': 'Share Your Creations!',
        'description': 'Post your favorite Minecraft builds below!',
        'isImagePost': false,
        'likes': 60.obs,
        'comments': 30.obs,
      },
      {
        'communityName': 'Apex Legends Squad',
        'postTitle': 'Image Post',
        'description': '',
        'isImagePost': true,
        'likes': 50.obs,
        'comments': 25.obs,
      },
    ]);

    // Initialize filtered posts with all posts
    filteredPosts.assignAll(posts);

    // Update filtered posts whenever search query changes
    debounce(searchQuery, (_) => filterPosts(), time: Duration(milliseconds: 300));
  }

  // Filter posts based on the search query
  void filterPosts() {
    if (searchQuery.isEmpty) {
      filteredPosts.assignAll(posts); // Reset to all posts
    } else {
      filteredPosts.assignAll(
        posts.where((post) {
          return post['communityName']
              .toString()
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()) ||
              post['postTitle']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              post['description']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase());
        }).toList(),
      );
    }
  }

  // Handle Like functionality
  void likePost(int index) {
    filteredPosts[index]['likes']++; // Increment the likes
  }

  // Handle Comment functionality
  void addComment(int index) {
    filteredPosts[index]['comments']++; // Increment the comments
  }

  // Change bottom navigation tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}