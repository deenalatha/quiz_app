import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'code.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Levels'),
          actions: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       for (int row = 0; row < 3; row++) // 3 rows with 2 buttons each
        //         Padding(
        //           padding: EdgeInsets.symmetric(vertical: 8.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               for (int col = 0; col < 2; col++) // 2 buttons in each row
        //                 Flexible(
        //                   child: Padding(
        //                     padding: EdgeInsets.all(8.0),
        //                     child: ElevatedButton(
        //                       style: ElevatedButton.styleFrom(
        //                         backgroundColor: Colors.white,
        //                         minimumSize: const Size(150, 40),
        //                       ),
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           Container(
        //                             width: 128,
        //                             height: 128,
        //                             decoration: const BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               image: DecorationImage(
        //                                 image: AssetImage(
        //                                   'assets/logo.png', //'assets/image_${(row * 2) + col + 1}.png'
        //                                 ),
        //                                 fit: BoxFit.cover,
        //                               ),
        //                             ),
        //                           ),
        //                           const SizedBox(height: 8),
        //                           Text(
        //                             'Level ${(row * 2) + col + 1}',
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                               fontSize: 18,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       onPressed: () {
        //                         print('''

        //                                      row ${row}
        //                                      col ${col}    ''');
        //                         Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                             builder: (context) =>
        //                                 QuizLevelPage(level: (row * 2) + col + 1),
        //                           ),
        //                         );
        //                       },
        //                     ),
        //                   ),
        //                 ),
        //             ],
        //           ),
        //         ),
        //     ],
        //   ),
        // ),

        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(6, (index) {
              return Center(
                child: Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(150, 40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 128,
                            height: 128,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/logo.png', //'assets/image_${(row * 2) + col + 1}.png'
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Level $index',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        print('hfdfjlsdkfjdslfkjsflksjfldskfjsdflksdfjsl');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizLevelPage(level: index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            })));
  }
}
