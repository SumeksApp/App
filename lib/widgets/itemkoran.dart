import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../podo/koran.dart';

Widget itemBarang(Feed barang) {
  // return Card(
  //   elevation: 2,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //   child: SizedBox(
  //     height: 1000,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         ClipRRect(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
  //           child: Image.network(
  //             barang.koranCoverImage,
  //             height: 60.0,
  //             width: double.infinity,
  //             fit: BoxFit.cover,
  //             // width: double.infinity,
  //           ),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 8.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.max,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text(
  //                   barang.namaKoran,
  //                   style:
  //                       TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                     "${barang.publishOn.day}-${barang.publishOn.month}-${barang.publishOn.year}")
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );

  return Container(
    width: 175.0,
    height: 280.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            height: 175.0,
            width: 280.0,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Hero(
                      tag: barang.id,
                      child: CachedNetworkImage(
                        imageUrl: barang.koranCoverImage,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/place.png",
                          fit: BoxFit.cover,
                          height: 175.0,
                          width: 175.0,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
          child: Text(
            barang.namaKoran,
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
          child: Text(
            "${barang.publishOn.day}-${barang.publishOn.month}-${barang.publishOn.year}",
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
