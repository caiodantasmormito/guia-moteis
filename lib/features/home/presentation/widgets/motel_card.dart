import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:guia_moteis/features/arguments/suite_photos_arguments.dart';
import 'package:guia_moteis/features/home/presentation/pages/suite_photos_page.dart';

// ignore: must_be_immutable
class MotelCard extends StatefulWidget {
  MotelCard({
    super.key,
    required this.name,
    required this.img,
    required this.subtitle,
    required this.media,
    required this.reviews,
    required this.suiteImages,
    required this.suiteNames,
    required this.suites,
    required this.categoryItensList,
    required this.period,
    required this.value,
  });

  String name;
  Widget img;
  String subtitle;
  String media;
  String reviews;
  List<List<String>> suiteImages;
  List<String> suiteNames;
  int suites;
  List<List<CategoryEntity>> categoryItensList;
  List<List<PeriodEntity>> period;
  List<List<PeriodEntity>> value;

  @override
  State<MotelCard> createState() => _MotelCardState();
}

class _MotelCardState extends State<MotelCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.name),
          trailing: const Icon(Icons.favorite),
          leading: widget.img,
          subtitle: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.subtitle),
              Row(
                spacing: 4,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.16,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 255, 203, 59),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(
                          widget.media,
                          style: GoogleFonts.urbanist(),
                        ),
                      ],
                    ),
                  ),
                  Text('${widget.reviews} avaliações '),
                  const Icon(Icons.arrow_drop_down_outlined),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: MediaQuery.of(context).size.height * 0.65,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.suites,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.push(
                    SuitePhotosPage.routeName,
                    extra:
                        SuitePhotosArguments(photos: widget.suiteImages[index]),
                  );
                },
                child: Column(
                  children: [
                    Image.network(
                      widget.suiteImages[index].isNotEmpty
                          ? widget.suiteImages[index][0]
                          : '',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Center(
                      child: Text(
                        widget.suiteNames[index],
                        style: GoogleFonts.urbanist(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.categoryItensList[index].map((category) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            category.icon,
                            width: MediaQuery.of(context).size.width * 0.09,
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: widget.period[index].map((period) {
                          return Column(
                            children: [
                              ListTile(
                                trailing: Icon(Icons.arrow_forward),
                                title: Text(
                                  period.tempoFormatado,
                                  style: GoogleFonts.urbanist(
                                      fontSize: 18, color: Colors.black),
                                ),
                                subtitle: Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      'R\$ ${period.value.toString()}',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 18,
                                          decoration:
                                              period.value != period.valueTotal
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                          color:
                                              period.value != period.valueTotal
                                                  ? Colors.grey
                                                  : Colors.black),
                                    ),
                                    if (period.value != period.valueTotal)
                                      Text(
                                        'R\$ ${period.valueTotal.toString()}',
                                        style: GoogleFonts.urbanist(
                                          fontSize: 18,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
