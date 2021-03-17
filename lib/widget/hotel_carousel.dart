import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/api/CRUDModel.dart';
import 'package:travel_apps/api/services.dart';
import 'package:travel_apps/model/hotel_model.dart';
import 'package:travel_apps/widget/hotel_card.dart';

class HotelCarousel extends StatelessWidget {
  List<HotelModel> hotelist;

  @override
  Widget build(BuildContext context) {
    final hotelProvider = Provider.of<CRUDModel>(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recommended Hotels',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 500.0,
          margin: EdgeInsets.all(10.0),
          child: StreamBuilder(
              stream: hotelProvider.showHotelStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  hotelist = snapshot.data.documents
                      .map((e) => HotelModel.fromMap(e.data, e.documentID))
                      .toList();

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: hotelist.length,
                    itemBuilder: (BuildContext context, int index) =>
                        HotelCard(hotelModel: hotelist[index]),
                  );
                } else {
                  return Text(
                    'Tunggu Sebentar',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
