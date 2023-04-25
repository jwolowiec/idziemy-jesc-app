import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idziemy_jesc/theme/app_theme.dart';
import 'package:idziemy_jesc/widgets/restaurant_starts.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.spacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem ipsum dolor sit",
            textAlign: TextAlign.left,
            style: AppTheme.typography.headline1,
          ),
          const RestaurantStars(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Lokalizacja",
                  style: AppTheme.typography.headline6,
                ),
              ),
              buildMap(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.colors.gray.shade800,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mazowiecka 69",
                      style: AppTheme.typography.bodyText2,
                    ),
                    Text(
                      "21-730 Szczecin",
                      style: AppTheme.typography.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Godziny otwarcia",
                  style: AppTheme.typography.headline6,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.gray.shade800,
                    borderRadius:
                        BorderRadius.circular(AppTheme.mainBorderRadiusValue),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Poniedziałek",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wtorek",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Środa",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Czwartek",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Piątek",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sobota",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "7:00-20:00",
                                    style: AppTheme.typography.bodyText2,
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Niedziela",
                                    style: AppTheme.typography.bodyText2!.copyWith(
                                      color: AppTheme.colors.textTertiary,
                                    ),
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Zamknięte",
                                    style: AppTheme.typography.bodyText2!.copyWith(
                                      color: AppTheme.colors.textTertiary,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Typy kuchni",
                  style: AppTheme.typography.headline6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 60,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: AppTheme.colors.gray.shade800,
                            borderRadius: BorderRadius.circular(
                                AppTheme.mainBorderRadiusValue)),
                        child: Text(
                          "Pizza",
                          textAlign: TextAlign.center,
                          style: AppTheme.typography.headline6,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 60,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: AppTheme.colors.gray.shade800,
                            borderRadius: BorderRadius.circular(
                                AppTheme.mainBorderRadiusValue)),
                        child: Text(
                          "Ramol",
                          textAlign: TextAlign.center,
                          style: AppTheme.typography.headline6,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 60,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: AppTheme.colors.gray.shade800,
                            borderRadius: BorderRadius.circular(
                                AppTheme.mainBorderRadiusValue)),
                        child: Text(
                          "Kebab",
                          textAlign: TextAlign.center,
                          style: AppTheme.typography.headline6,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 60,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        // decoration: BoxDecoration(
                        //     color: AppTheme.colors.gray.shade800,
                        //     borderRadius: BorderRadius.circular(
                        //         AppTheme.mainBorderRadiusValue)),
                        // child: Text(
                        //   "Kebab",
                        //   textAlign: TextAlign.center,
                        //   style: AppTheme.typography.headline6,
                        // ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Container buildMap() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: AppTheme.colors.gray.shade500.withOpacity(.5),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
    width: double.infinity,
    height: 160,
  );
}
