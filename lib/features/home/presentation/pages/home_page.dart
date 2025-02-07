import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:guia_moteis/features/home/presentation/cubit/get_motel_cubit.dart';

import 'package:guia_moteis/features/home/presentation/widgets/motel_card.dart';
import 'package:guia_moteis/features/home/presentation/widgets/select_filters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final GetMotelCubit _getMotelCubit;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _getMotelCubit = context.read<GetMotelCubit>()..getMotel();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.list,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 17, 0),
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                ),
                height: 48,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _tabController.animateTo(0);
                        },
                        child: IntrinsicWidth(
                          child: Stack(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(32)),
                                ),
                              )
                                  .animate(
                                      target: _tabController.index == 0 ? 1 : 0)
                                  .fade(begin: 0, end: 1, duration: 150.ms),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                alignment: Alignment.center,
                                child: Text(
                                  'ir agora',
                                  style: GoogleFonts.urbanist(
                                    color: _tabController.index == 0
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _tabController.animateTo(1);
                        },
                        child: IntrinsicWidth(
                          child: Stack(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(32)),
                                ),
                              )
                                  .animate(
                                      target: _tabController.index == 1 ? 1 : 0)
                                  .fade(begin: 0, end: 1, duration: 150.ms),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                alignment: Alignment.center,
                                child: Text(
                                  'ir outro dia',
                                  style: GoogleFonts.urbanist(
                                    color: _tabController.index == 1
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SelectFilters(),
            ),
            BlocBuilder<GetMotelCubit, GetMotelState>(
              bloc: _getMotelCubit,
              builder: (context, state) {
                if (state is GetMotelLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetMotelSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final motel = state.data[index];

                        final suiteImages =
                            motel.suites.map((suite) => suite.photo).toList();
                        final suiteNames =
                            motel.suites.map((suite) => suite.name).toList();
                        final categoryItensList = motel.suites
                            .map((suite) => suite.categoryItens)
                            .toList();
                        final timeList =
                            motel.suites.map((suite) => suite.period).toList();

                        return Column(
                          children: [
                            MotelCard(
                              name: motel.name,
                              img: Image.network(motel.logo),
                              subtitle: motel.neighborhood,
                              media: motel.media.toString(),
                              reviews: motel.qtdAvaliacoes.toString(),
                              suiteImages: suiteImages,
                              suiteNames: suiteNames,
                              suites: motel.suites.length,
                              categoryItensList: categoryItensList,
                              period: timeList,
                              value: timeList,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: Text('Erro inexperado'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
