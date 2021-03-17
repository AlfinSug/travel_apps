import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/api/CRUDModel.dart';
import 'package:travel_apps/model/hotel_model.dart';

class UpdateScreen extends StatefulWidget {
  final HotelModel hotelModel;

  UpdateScreen({@required this.hotelModel});
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  String desc;
  String name;
  String address;
  String price;

  @override
  Widget build(BuildContext context) {
    var hotelProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Update Hotel',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.hotelModel.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Hotel Name',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(
                        Icons.hotel,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Hotel Name';
                    }
                  },
                  onSaved: (value) => name = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.hotelModel.price.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.monetization_on,
                    ),
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => price = value),

              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.hotelModel.address,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(
                        Icons.map,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The Address';
                    }
                  },
                  onSaved: (value) => address = value),
              SizedBox(
                height: 16,
              ),

              TextFormField(
                  initialValue: widget.hotelModel.desc,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.description)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The Description';
                    }
                  },
                  onSaved: (value) => desc = value),
              // DropdownButton<String>(
              //   value: roomType,
              //   onChanged: (String newValue) {
              //     setState(() {
              //       roomType = newValue;
              //     });
              //   },
              //   items: <String>['Single Bed', 'Double Bed', 'Queen']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),

              SizedBox(
                height: 25,
              ),
              RaisedButton(
                  animationDuration: Duration(milliseconds: 300),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                  splashColor: Colors.blue[400],
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await hotelProvider.updateHotel(
                          HotelModel(
                            name: name,
                            address: address,
                            price: int.tryParse(price),
                            desc: desc,
                          ),
                          widget.hotelModel.id);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Update',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  color: Theme.of(context).primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
