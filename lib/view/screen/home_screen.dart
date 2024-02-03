import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/news_headline_model.dart';
import 'package:newsapp/view_model/news_view_model.dart';
import 'package:newsapp/widget/loding_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel=NewsViewModel();
  final format=DateFormat("yyyy/dd/mm");
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "NEWS",
            style: GoogleFonts.aBeeZee(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/category_icon.png",
              height: 30,
              width: 30,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ]),
      body: ListView(
        children: [
          SizedBox(
            height: height * .5,
            width: width,
            child: FutureBuilder<NewsHeadlineModel>(
              future: NewsViewModel().fectchNewChannelHeadLinesApi(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const spinkit();
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime=DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                      return SizedBox(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: width * .9,
                              height: height * 0.6,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * .02),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const spinkit(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error_outline_rounded,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 40,
                              child: Card(
                                elevation: 5,
                                color: Color.fromARGB(181, 188, 186, 186),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: height * .22,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * 0.7,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(width:width*0.7 ,
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                           Text(
                                            snapshot
                                                .data!.articles![index].source!.name
                                                .toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                           Text(format.format(dateTime),
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ]),)

                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
