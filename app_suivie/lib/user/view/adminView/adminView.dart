import 'package:app_suivie/user/view/adminView/Comments.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageWeb extends StatefulWidget {
  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth * 0.1;
    final fontSize = screenWidth * 0.05;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B88D0').withOpacity(.9),
        title: Row(
          children: [
            Image.asset(
              'assets/images/image.png',
              height: 90,
              width: 80,
            ),
            const Padding(padding: EdgeInsets.only(left: 30)),
            Text(
              'App Name',
              style: GoogleFonts.oleoScript(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingValue),
            ),
            Flexible(
                child: SizedBox(
              width: 300,
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    _searchText = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for a User...', // Placeholder
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true, // Remplir la couleur du fond
                  fillColor: Colors.white,
                ),
              ),
            )),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Icon de déconnexion
            onPressed: () {
              // Code pour effectuer la déconnexion
            },
          ),
        ],
      ),
      
      
      body: Center(
        child: Container(
          color: HexColor('#C6E7F3').withOpacity(0.4),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: HexColor('#4B88D0').withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 6,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: HexColor('#EEF2F3').withOpacity(0.5),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: HexColor('#221D67'),
                                  ), // icone
                                  Text(
                                    "Use Admin",
                                    style: GoogleFonts.oleoScript(
                                      fontSize: 25,
                                      color: HexColor('#221D67'),
                                    ),
                                  ), // texte
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 20)),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'UserAdmin@gmail.com',
                                    style: GoogleFonts.oleoScript(
                                      fontSize: 25,
                                      color: HexColor('#221D67'),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 6,
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor('#EEF2F3').withOpacity(0.5),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: HexColor('#4B88D0'),
                                  size: 30,
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20)), // icone
                                Text(
                                  "100 User",
                                  style: GoogleFonts.oleoScript(
                                    fontSize: 15,
                                    color: HexColor('#221D67'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 6,
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor('#EEF2F3').withOpacity(0.5),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.money,
                                  color: HexColor('#4B88D0'),
                                  size: 30,
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20)), // icone
                                Text(
                                  "100D Total Profit",
                                  style: GoogleFonts.oleoScript(
                                    fontSize: 15,
                                    color: HexColor('#221D67'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 6,
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10, top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor('#EEF2F3').withOpacity(0.5),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          //const SizedBox(width: 10),
                                          Text(
                                            'Home    ',
                                            style: GoogleFonts.oleoScript(
                                              fontSize: 25,
                                              color: HexColor('#221D67'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                     Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>Comments()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.comment,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Comments',
                                              style: GoogleFonts.oleoScript(
                                                fontSize: 25,
                                                color: HexColor('#221D67'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                color: HexColor('#9CD8EF').withOpacity(0.6),
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                        
                          ),
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: HexColor('#4B88D0').withOpacity(0.5),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                     
                                      padding: EdgeInsets.all(10),

                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: HexColor('#EEF2F3')
                                            .withOpacity(0.5),
                                      ),

                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              
                                              child: Text(
                                                'user name',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.oleoScript(
                                                  fontSize: 20,
                                                  color: HexColor('#221D67'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .1),
                                            ),
                                            SizedBox(
                                              width: 100,
                                             
                                              child: Text(
                                                'Email',
                                                style: GoogleFonts.oleoScript(
                                                  fontSize: 20,
                                                  color: HexColor('#221D67'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .1),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              
                                              child: Text(
                                                'registration Date',
                                                style: GoogleFonts.oleoScript(
                                                  fontSize: 20,
                                                  color: HexColor('#221D67'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .1),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              
                                              child: Text(
                                                'Subscription Status',
                                                style: GoogleFonts.oleoScript(
                                                  fontSize: 20,
                                                  color: HexColor('#221D67'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .1),
                                            ),
                                            SizedBox(
                                              width: 100,
                                             
                                              child: Text(
                                                'Operation',
                                                style: GoogleFonts.oleoScript(
                                                  fontSize: 20,
                                                  color: HexColor('#221D67'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Column(
                                        children: userList
                                            .map(
                                              (user) => Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                padding: EdgeInsets.only(
                                                    top: 20, bottom: 20),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        user['userName'],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .oleoScript(
                                                          fontSize: 15,
                                                          color: HexColor(
                                                              '#221D67'),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .1),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        user['email'],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .oleoScript(
                                                          fontSize: 15,
                                                          color: HexColor(
                                                              '#221D67'),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .1),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        user['date'],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .oleoScript(
                                                          fontSize: 15,
                                                          color: HexColor(
                                                              '#221D67'),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .1),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        user['status'],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .oleoScript(
                                                          fontSize: 15,
                                                          color: HexColor(
                                                              '#221D67'),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .1),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        user['operation'],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .oleoScript(
                                                          fontSize: 15,
                                                          color: HexColor(
                                                              '#221D67'),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                 
                                 
                                 
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  )
                  ),
            
            
            
            
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> userList = [
  {
    'userName': 'John dcbkjdlc',
    'email': 'bjdFVFCDCDCDh@gmail.com',
    'date': 'xxxxx',
    'status': 'Paid/Pending payment/Expired',
    'operation': 'Delete/Notify'
  },
  {
    'userName': 'John',
    'email': 'bjdh@gmail.com',
    'date': 'xxxxx',
    'status': 'Paid/Pending payment/Expired',
    'operation': 'Delete/Notify'
  },
  {
    'userName': 'John',
    'email': 'bjdh@gmail.com',
    'date': 'xxxxx',
    'status': 'Paid/Pending payment/Expired',
    'operation': 'Delete/Notify'
  },
  {
    'userName': 'John dcbkjdlc',
    'email': 'bjdFVFCDCDCDh@gmail.com',
    'date': 'xxxxx',
    'status': 'Paid/Pending payment/Expired',
    'operation': 'Delete/Notify'
  },
  {
    'userName': 'John dcbkjdlc',
    'email': 'bjdFVFCDCDCDh@gmail.com',
    'date': 'xxxxx',
    'status': 'Paid/Pending payment/Expired',
    'operation': 'Delete/Notify'
  },
];
