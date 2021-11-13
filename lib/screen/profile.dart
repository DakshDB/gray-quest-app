import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gray_quest/controller/profile_controller.dart';
import 'package:gray_quest/model/user_model.dart';
import 'package:gray_quest/provider/user_id_provider.dart';
import 'package:gray_quest/screen/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  initState() {
    super.initState();
    context
        .read(profileProvider.notifier)
        .getUserProfile(context.read(userIdProvider).state);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      User user = watch(profileProvider);
      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                color: Theme.of(context).accentColor,
                width: MediaQuery.of(context).size.width,

                height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    Text(
                      "User Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headline1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BASIC INFORMATION",
                          style: Theme.of(context).textTheme.headline4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.name ?? "Name",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email Address",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.email ?? "Email Address",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Username",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.username ?? "Username",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phone no.",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.phone ?? "Phone no.",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Website",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.website ?? "Website",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Company",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(user.company ?? "Company",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height / 4.5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("ADDRESS INFORMATION",
                          style: Theme.of(context).textTheme.headline4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Street",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            user.address != null
                                ? user.address!.street
                                : "Street",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Suite",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            user.address != null
                                ? user.address!.suite
                                : "Suite",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("City",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            user.address != null
                                ? user.address!.city
                                : "City",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Zipcode",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            user.address != null
                                ? user.address!.zipcode
                                : "Zipcode",
                            style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false);
                  },
                  child: Text("LOGOUT",
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
