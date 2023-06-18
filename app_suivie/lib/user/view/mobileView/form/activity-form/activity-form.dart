import 'package:app_suivie/user/controller/user.controller.dart';
import 'package:app_suivie/user/model/user.model.dart';
import 'package:app_suivie/user/view/mobileView/Components/activities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/src/datetime_picker_theme.dart'
    as datePicker;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../../../controller/AcivityController.dart';
import '../../../../model/Activity.model.dart';
import 'PositionPickerDialog.dart';

class ActivityAdd extends StatefulWidget {
  final String? idEnfant;
  const ActivityAdd({Key? key, required this.idEnfant}) : super(key: key);

  @override
  State<ActivityAdd> createState() => _ActivityAddState();
}

class _ActivityAddState extends State<ActivityAdd> {
  String? _id;
  final _formKey = GlobalKey<FormState>();
  final MapController mapController = MapController();
  LatLng? selectedLocation;
  TextEditingController _controller = TextEditingController();
  final _ctrplaceName = TextEditingController();
  final _ctrEndTime = TextEditingController();
  final _ctrStartTime = TextEditingController();

  DateTime? _endTime;
  DateTime? _startTime;

  String selectedPositionName = '';
  void _onLocationSelected(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
  }

  void _onTextChanged(String value) {
    // Nothing to do here
  }
  @override
  void initState() {
    super.initState();
    _id = widget.idEnfant;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: HexColor("#EFF7FA"),
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          "Add Activity",
          style: GoogleFonts.oleoScript(
              fontSize: 27,
              fontStyle: FontStyle.italic,
              color: HexColor("#FFFFFF")),
        ),
        backgroundColor: HexColor("#87B1F8"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Activities(id: _id)),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: HexColor("#FFFFFF"),
          size: 30,
          // Change la couleur de l'icône à rouge
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: TextFormField(
                  controller: _ctrplaceName,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.map,
                      color: HexColor("#87B1F8"),
                    ),
                    hintText: 'Enter a place',
                    labelText: 'PlaceName',
                    labelStyle: GoogleFonts.oleoScript(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: HexColor("#000000").withOpacity(0.3),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: DateTimeField(
                  controller: _ctrStartTime,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.timer,
                      color: HexColor("#87B1F8"),
                    ),
                    labelText: 'StartTime',
                    labelStyle: GoogleFonts.oleoScript(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: HexColor("#000000").withOpacity(0.3),
                    ),
                  ),
                  format: DateFormat('yyyy-MM-dd HH:mm'),
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                        currentValue ?? DateTime.now(),
                      ),
                    );
                    if (time != null) {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: currentValue ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      final dateTime = DateTimeField.combine(date!, time);
                      return dateTime;
                    } else {
                      return currentValue;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter a valid start time';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _startTime = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: DateTimeField(
                  controller: _ctrEndTime,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.timer_off,
                      color: HexColor("#87B1F8"),
                    ),
                    labelText: 'EndTime',
                    labelStyle: GoogleFonts.oleoScript(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: HexColor("#000000").withOpacity(0.3),
                    ),
                  ),
                  format: DateFormat('yyyy-MM-dd HH:mm'),
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                        currentValue ?? DateTime.now(),
                      ),
                    );
                    if (time != null) {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: currentValue ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      final dateTime = DateTimeField.combine(date!, time);
                      setState(() {
                        _endTime = dateTime;
                      });
                      return dateTime;
                    } else {
                      return currentValue;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter a valid end time';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _endTime = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.place,
                      color: HexColor("#87B1F8"),
                    ),
                    hintText: '',
                    labelText: 'Position',
                    labelStyle: GoogleFonts.oleoScript(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: HexColor("#000000").withOpacity(0.3),
                    ),
                  ),
                  onTap: () async {
                    LatLng selectedPosition = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PositionPickerDialog();
                      },
                    );

                    if (selectedPosition != null) {
                      try {
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                          selectedPosition.latitude,
                          selectedPosition.longitude,
                        );

                        setState(() {
                          _controller.text = placemarks.first.name!;
                          selectedPositionName = placemarks.first.name!;
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid date';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      size: 40,
                      color: HexColor("#87B1F8"),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final activity = Activity(
                            idParent: getCurrentUserId()!,
                            idEnfant: _id!,
                            PlaceName: _ctrplaceName.text,
                            StartTime: _ctrStartTime.text,
                            EndTime: _ctrEndTime.text,
                            Position: _controller.text,
                            NotifSended: false);
                        addActivity(activity);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Activities(id: _id)),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
