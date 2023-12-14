import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
   CommentScreen({super.key});
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage('profile photo'),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'username',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.red),
                          ),
                          Text(
                            'Comment Dscription',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "10 likes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentController,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Comment",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                    enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                      color: Colors.red,
                     ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                      color: Colors.green,
                     ),
                    )
                  ),
                ),
                trailing: TextButton.icon(
                  onPressed: () {
                    
                  }, 
                  icon: Icon(Icons.send), 
                  label: Text("Send")
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
