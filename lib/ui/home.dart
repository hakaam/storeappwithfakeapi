import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceappwithapiiiiiiis/repositry/category_repo.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // List<DameData> categore = [
  //   DameData(photo: 'images/shirt.png', title: 'Man Shirt'),
  //   DameData(photo: 'images/shirt.png', title: 'Dress'),
  //   DameData(photo: 'images/shirt.png', title: 'Man Work'),
  //   DameData(photo: 'images/shirt.png', title: 'Man Bag'),
  //   DameData(photo: 'images/shirt.png', title: 'Man Shoes'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff40BFFF),
                            ),
                            hintText: 'Search Product',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xff909881),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Color(0xff909881),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, int itemIndex, int pageViewIndex) {
                      return Container(
                        width: 300,
                        child: InkWell(
                          onTap: () {},
                          child: Image.network(
                              'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60'),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'MoreCategory',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                FutureBuilder<List<CategoryModel>>(
                    future: CategoryRepo().getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      var data = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: 70,
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(data[index].image),
                                        radius: 40,

                                      ),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data[index].name,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else{

                       return  SizedBox();
                      }
                    }
                      ),
                SizedBox(height: 15,),
                Container(
                  height: 150,
                  width: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEBF0FF)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              'https://w7.pngwing.com/pngs/484/755/png-transparent-sneakers-shoe-air-jordan-nike-footwear-jordan-white-orange-basketballschuh-thumbnail.png',
                              scale: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('\$299.99'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEBF0FF)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              'https://w7.pngwing.com/pngs/484/755/png-transparent-sneakers-shoe-air-jordan-nike-footwear-jordan-white-orange-basketballschuh-thumbnail.png',
                              scale: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('\$299.99'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Image.asset(
                      'images/shhhhhhh.jpg',
                      width: 500,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            'Recommended\nProduct',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'We recommend the best for you',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1 / 1.5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEBF0FF),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/shoeeeeee.jpg',
                              height: 120,
                              width: 100,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nike Air Max 270\nReact ENG',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  opticalSize: 1,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  opticalSize: 1,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  opticalSize: 1,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  opticalSize: 1,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  opticalSize: 1,
                                  size: 15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('\$299.43'),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$534.43',
                                  style: TextStyle(
                                    decoration: TextDecoration.overline,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('24% off')
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
