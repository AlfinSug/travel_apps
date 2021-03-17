import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/api/CRUDModel.dart';
import 'package:travel_apps/model/hotel_model.dart';
import 'package:travel_apps/screen/homescreen.dart';
import 'package:travel_apps/screen/update_screen.dart';

class HotelCard extends StatelessWidget {
  final HotelModel hotelModel;

  HotelCard({@required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    var hotelProvider = Provider.of<CRUDModel>(context);

    return ExpansionTileCard(
      leading: Icon(
        Icons.cloud_circle,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        hotelModel.name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      subtitle: Text(
        hotelModel.address,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      children: <Widget>[
        Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.monetization_on,
                    color: Colors.orangeAccent,
                  ),
                  title: Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: Text(
                    'Rp ' + hotelModel.price.toString() + ',-/Malam',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: Text(
                    hotelModel.desc,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonHeight: 52.0,
          buttonMinWidth: 90.0,
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => UpdateScreen(
                              hotelModel: hotelModel,
                            )));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.edit),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Edit'),
                ],
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              onPressed: () async {
                await hotelProvider.delHotel(hotelModel.id);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.delete_forever),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Delete'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
