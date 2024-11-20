import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalWidgets {
  // Custom App Bar
  static AppBar customAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        title,
        style: GoogleFonts.orbitron(
          fontSize: 18.sp,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white, size: 22.sp),
          onPressed: () {
            // Implement notifications action
          },
        ),
      ],
    );
  }

  // Search Bar Widget
  static Widget searchBar({
    required Function(String) onSearch,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: TextField(
        onChanged: onSearch, // Update search query
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: GoogleFonts.poppins(color: Colors.white54),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white54),
        ),
      ),
    );
  }

  // Custom Bottom Navigation Bar
  static Widget customBottomNavigationBar({
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.cyanAccent,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
      ],
    );
  }

  // Post Card Widget
  static Widget postCard({
    required String communityName,
    required String postTitle,
    required String description,
    required bool isImagePost,
    required int likes,
    required int comments,
    required VoidCallback onLike,
    required VoidCallback onComment,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Community Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 3.w,
                    backgroundColor: Colors.cyanAccent,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    communityName,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {
                  // More options
                },
              ),
            ],
          ),
          SizedBox(height: 1.h),

          // Post Title
          Text(
            postTitle,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (!isImagePost)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.white70,
                ),
              ),
            ),

          // Image for Image Post
          if (isImagePost)
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(Icons.image, color: Colors.white54, size: 12.w),
              ),
            ),

          // Post Actions (Like, Comment, Share)
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Like Button
                GestureDetector(
                  onTap: onLike,
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined,
                          color: Colors.white54, size: 18.sp),
                      SizedBox(width: 1.w),
                      Text(
                        likes.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4.w),

                // Comment Button
                GestureDetector(
                  onTap: onComment,
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline,
                          color: Colors.white54, size: 18.sp),
                      SizedBox(width: 1.w),
                      Text(
                        comments.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4.w),

                // Share Button
                GestureDetector(
                  onTap: () {
                    // Add share functionality here
                  },
                  child: Icon(Icons.send, color: Colors.white54, size: 18.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}