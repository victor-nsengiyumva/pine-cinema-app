import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pine/common_widgets/movieCard2_withoutLabelBelow.dart';
import 'package:pine/common_widgets/red_button_small.dart';
import 'package:pine/features/cinema/data/availableCinemasData.dart';
import 'package:pine/features/cinema/presentation/movies_showing.dart';



class Theatres extends StatefulWidget {
  const Theatres({super.key});

  @override
  State<Theatres> createState() => _TheatresState();
}

class _TheatresState extends State<Theatres> {
  @override
  Widget build(BuildContext context) {
    dynamic showDate;
    var textTheme = Theme.of(context).textTheme;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.notifications_outlined,
                size: 27,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 27,
              ),
            )
          ],
        title: Text(
          'Cinemas',
          style: textTheme.bodyLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(children: [
          ...locations.map(
            (location) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          MovieCard2(
                            image: location['image'],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  location['name'],
                                  style: textTheme.bodyLarge!
                                      .copyWith(fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                location['building'],
                                style: textTheme.bodyMedium!
                                    .copyWith(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                location['address'],
                                style:
                                    textTheme.bodyLarge!.copyWith(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ButtonSmall(
                                height: 37,
                                text: 'Movies Showing',
                                width: 150,
                                onpressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      helpText:
                                          'Select date ',
                                          
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('EE, d-MM-y')
                                            .format(pickedDate);

                                    setState(() {
                                      showDate = formattedDate;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoviesShowing(
                                                      showDate: showDate,
                                                      location:
                                                          location['name'])));
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.place,
                                    color: theme.primaryColor,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            },
          ).toList()
        ]),
      )),
    );
  }
}