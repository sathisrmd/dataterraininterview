import 'package:dataterrain/app_export.dart';
import 'package:dataterrain/gl_script.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dataterrain/views/program_view_mobile.dart';


class DashboardViewMobile extends StatefulWidget {
  @override
  State<DashboardViewMobile> createState() => _DashboardViewMobileState();
}

class _DashboardViewMobileState extends State<DashboardViewMobile> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    DashboardContent(), // Dashboard content
    ProgramViewMobile(), // Programs page
    UsersScreen(), // Users page (placeholder)
    RequestsScreen(), // Requests page (placeholder)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //title: Text("Dashboard"),// No shadow
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              child: Image.asset("assets/images/profile.png"),
              radius: 18,

            ),
          ),
        ),
        leadingWidth: 56,
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFEEF5FF),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF00AEBD),
                  size: 24,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF5FF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Color(0xFF00AEBD),
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 10,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Use Builder to get the correct Scaffold context
          Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 240, // Increased height to accommodate the "Admin" text
              color: Colors.white, // Background color remains white
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  children: [
                    // Row for the "Admin" text aligned to the left
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Admin",
                          style: TextStyle(
                            color: Color(0xff1D5BBF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12), // Space between "Admin" and the profile picture
                    // Centered content (profile picture, name, email)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Mentor",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Divider below the custom header
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text("Scheduler"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dynamic_feed_rounded),
              title: Text("Timesheet"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Discussions"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.description),
              title: Text("Reports"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text("Feedback"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_outlined),
              title: Text("Certificates"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dynamic_feed_rounded),
              title: Text("Feed"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics_outlined),
              title: Text("Analytics"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "Programs"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: "Requests"),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlannedProgramsCard(),
          SizedBox(height: 20),
          ProgramStatusMetricsCard(),
          SizedBox(height: 20),
          TopProgramsCard(),
          ProgramTypeMetricsCard(),
          SizedBox(height: 20),
          ProgramModeMetricsCard(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PlannedProgramsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "Planned Programs",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "VIEW ALL",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF4DE),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "327",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Programs",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFC9F7F5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "120",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Mentors",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEEE5FF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "556",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Mentees",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}


class ProgramStatusMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "ProgramStatus Metrics",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Months",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            Padding(
              child: Text('Program Status Metrics',
                  style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            ),
            // Text('- chart capture all gestures'),
            Container(
              child: Echarts(
                extensions: [glScript],
                captureAllGestures: true,
                option: '''
                    {
                    color: ['#C7DEFF', '#7E9FD4', '#1D5BBF'],  // Custom colors for each series
  legend: { orient: 'horizontal',  // Ensures legends are in a row
    bottom: 0   },
  tooltip: {},
  dataset: {
    source: [
      ['product', 'All Programs', 'Active', 'Completed'],
      ['Jan', 10, 8, 30],
      ['Feb', 30, 45, 45],
      ['Mar', 50, 30, 50],
     
    ]
  },
  xAxis: { type: 'category' },
  yAxis: {},
  // Declare several bar series, each will be mapped
  // to a column of dataset.source by default.
  series: [{ type: 'bar' }, { type: 'bar' }, { type: 'bar' }]
}
                  ''',
              ),
              width: 300,
              height: 250,
            ),

          ],
        ),
      ),
    );
  }
}

class TopProgramsCard extends StatefulWidget {
  @override
  State<TopProgramsCard> createState() => _TopProgramsCardState();
}

class _TopProgramsCardState extends State<TopProgramsCard> {
  final List<Map<String, String>> programs = [
    {
      "Program Name": "Leadership Growth",
      "Category": "Engineer",
      "Created By": "(202) 555-0191",
      "Rating": "contact@company.com",
    },
    {
      "Program Name": "Tech Mentorship",
      "Category": "Doctor",
      "Created By": "(303) 555-0123",
      "Rating": "support@ir.com",
    },
    {
      "Program Name": "Career Guidance",
      "Category": "Artist",
      "Created By": "(404) 555-0145",
      "Rating": "info@techstars.com",
    },
    {
      "Program Name": "Business Skills",
      "Category": "Chef",
      "Created By": "(505) 555-0167",
      "Rating": "hello@design.com",
    },
    {
      "Program Name": "Soft Skills",
      "Category": "Teacher",
      "Created By": "(606) 555-0189",
      "Rating": "team@future.com",
    },
  ];

  final List<Map<String, String>> mentors = [
    {
      "Program Name": "Jonh kennedy",
      "Category": "Teaching Program",
      "Created By": "johnk@gmail.com",
      "Rating": "4.9",
    },
    {
      "Program Name": "jenifer smith",
      "Category": "Teaching Program",
      "Created By": "Jenifer Smith",
      "Rating": "4.8",
    },
    {
      "Program Name": "Thomasshelby",
      "Category": "Teaching Program",
      "Created By": "Thomas shelby",
      "Rating": "4.7",
    },
    {
      "Program Name": "John miller",
      "Category": "Teaching Program",
      "Created By": "John Miller	",
      "Rating": "4.6",
    },
    {
      "Program Name": "Jasonmorgan",
      "Category": "Teaching Program",
      "Created By": "Jason Morgan ",
      "Rating": "4.5",
    },
  ];

  // final List<String> months = [
  //   "January",
  //   "February",
  //   "March",
  //   "April",
  //   "May",
  //   "June",
  //   "July",
  //   "August",
  //   "September",
  //   "October",
  //   "November",
  //   "December",
  // ];
  // String? selectedMonth;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedMonth = months[0]; // Default to January
  // }
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "Top Programs",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 260,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for the table
                        border: Border.all(color: Colors.grey[300]!), // Outer border
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Match the border radius
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 600,
                          ),
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(color: Colors.grey[300]!),
                              verticalInside: BorderSide(color: Colors.grey[300]!),
                              top: BorderSide.none, // Remove top border (handled by Container)
                              bottom: BorderSide.none, // Remove bottom border
                              left: BorderSide.none, // Remove left border
                              right: BorderSide.none, // Remove right border
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(150),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(200),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Color(0xffD9E4F2)
                                ),
                                children: [
                                  _buildTableCell("Program Name", isHeader: true),
                                  _buildTableCell("Category", isHeader: true),
                                  _buildTableCell("Created By", isHeader: true),
                                  _buildTableCell("Rating", isHeader: true),
                                ],
                              ),
                              ...programs.map((program) {
                                return TableRow(
                                  children: [
                                    _buildTableCell(program["Program Name"]!),
                                    _buildTableCell(program["Category"]!),
                                    _buildTableCell(program["Created By"]!),
                                    _buildTableStar(program["Rating"]!),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "Top Mentors",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 260,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for the table
                        border: Border.all(color: Colors.grey[300]!), // Outer border
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Match the border radius
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 600,
                          ),
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(color: Colors.grey[300]!),
                              verticalInside: BorderSide(color: Colors.grey[300]!),
                              top: BorderSide.none, // Remove top border (handled by Container)
                              bottom: BorderSide.none, // Remove bottom border
                              left: BorderSide.none, // Remove left border
                              right: BorderSide.none, // Remove right border
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(150),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(200),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Color(0xffD9E4F2)
                                ),
                                children: [
                                  _buildTableCell("Menter Name", isHeader: true),
                                  _buildTableCell("Program", isHeader: true),
                                  _buildTableCell("Email", isHeader: true),
                                  _buildTableCell("Rating", isHeader: true),
                                ],
                              ),
                              ...mentors.map((mentor) {
                                return TableRow(
                                  children: [
                                    _buildTableCell(mentor["Program Name"]!),
                                    _buildTableCell(mentor["Category"]!),
                                    _buildTableCell(mentor["Created By"]!),
                                    _buildTableCell(mentor["Rating"]!),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }
  Widget _buildTableStar(String text, {bool isHeader = false}) {
    return Row(
      children: [
        Icon(Icons.star,color: Colors.yellow,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        )
      ],
    );
  }
}
class ProgramTypeMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "Program Type Metrics",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Month",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            Padding(
              child: Text('Program Status Metrics',
                  style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            ),
            // Text('- chart capture all gestures'),
            Container(
              child: Echarts(
                extensions: [glScript],
                captureAllGestures: true,
                option: '''
                    {
  tooltip: {
    trigger: 'item'
  },
                    color: ['#1954BF', '#FFBB00'],  // Custom colors for each series
  legend: { orient: 'horizontal',  // Ensures legends are in a row
    bottom: 0   },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: ['75%', '60%'],
      avoidLabelOverlap: false,
      label: {
        show: false,
        position: 'center'
      },
      emphasis: {
        label: {
          show: true,
          fontSize: 40,
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: false
      },
      data: [
        { value: 40, name: 'Premium 40' },
        { value: 54, name: 'Free 54' }
      ]
    }
  ]
}
                  ''',
              ),
              width: 300,
              height: 250,
            ),

          ],
        ),
      ),
    );
  }
}


class ProgramModeMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 8.0),
                    ),
                    Text(
                      "Program Mode Metrics",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Month",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            Padding(
              child: Text('Program Status Metrics',
                  style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            ),
            // Text('- chart capture all gestures'),
            Container(
              child: Echarts(
                extensions: [glScript],
                captureAllGestures: true,
                option: '''
                    {
  tooltip: {
    trigger: 'item'
  },
                    color: ['#1D5BBF', '#D4E6FF'],  // Custom colors for each series
  legend: { orient: 'horizontal',  // Ensures legends are in a row
    bottom: 0   },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: ['75%', '60%'],
      avoidLabelOverlap: false,
      label: {
        show: false,
        position: 'center'
      },
      emphasis: {
        label: {
          show: true,
          fontSize: 40,
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: false
      },
      data: [
        { value: 40, name: 'Virtual 36' },
        { value: 54, name: 'Physical 50' }
      ]
    }
  ]
}
                  ''',
              ),
              width: 300,
              height: 250,
            ),

          ],
        ),
      ),
    );
  }
}

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Users Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class RequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Requests Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}