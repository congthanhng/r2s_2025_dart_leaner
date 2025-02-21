
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Favorite page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/windows.png"),
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzeriand',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15,),
                Icon(Icons.star, size: 40, color: Colors.red,),
                SizedBox(width: 15,),
                Text('41', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 30,),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.call, size: 40, color: Colors.blue, )),
                    const Text('CALL', style: TextStyle(fontSize: 15, color: Colors.blue),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.near_me, size: 40, color: Colors.blue,)),
                    Text('ROUTE', style: TextStyle(fontSize: 15, color: Colors.blue),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.share, size: 40, color: Colors.blue,)),
                    Text('SHARE', style: TextStyle(fontSize: 15, color: Colors.blue),)
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hiking around the lake in currently impossible. But there is beautiful way that starts along the lake before going up on the left (400m elevation gain) and coming back above it, offering incredible panoramas (see pictures). This is what I did, with an incredible pleasure. Mind this is a T2 hike, requiring some experience and the appropriate gear.',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}