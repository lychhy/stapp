import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF6D90FF),
          automaticallyImplyLeading: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Profile'),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            // Add scrolling capability
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: double.infinity,
                    height: 143,
                    decoration: const BoxDecoration(
                      color: Color(0x8CFFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: 120,
                              height: 150,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/795/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(
                              width: 10), // Add spacing between items

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
                              children: [
                                const SizedBox(height: 10),
                                Expanded(child: buildTextField('Name')),
                                const SizedBox(height: 5),
                                Expanded(child: buildTextField('Grade')),
                                const SizedBox(height: 5),
                                Expanded(child: buildTextField('ID')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    shrinkWrap: true, // Prevent infinite height
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable inner scroll
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount: 4, // Adjust as needed
                    itemBuilder: (context, index) {
                      return buildGridItem([
                        'New Course',
                        'Study Group',
                        'Reminder',
                        'Tracking'
                      ][index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildGridItem(String title) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          colors: [Color(0xFF739BD0), Color(0xFFB2ACEF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter Tight',
        ),
      ),
    );
  }
}
