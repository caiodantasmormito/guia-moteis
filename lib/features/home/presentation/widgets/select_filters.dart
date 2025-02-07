import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectFilters extends StatefulWidget {
  const SelectFilters({super.key});

  @override
  State<SelectFilters> createState() => _SelectFiltersState();
}

class _SelectFiltersState extends State<SelectFilters> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(spacing: 8, children: [
          FilterChip(
            avatar: Icon(Icons.format_list_bulleted_sharp),
            label: Text(
              'filtros',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'com desconto',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'disponíveis',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'hidro',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'piscina',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'sauna',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'ofurô',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'decoração erótica',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'cadeira erótica',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'pista de dança',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'garagem privativa',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'frigo bar',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'internet wi-fi',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'suíte para festas',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          ),
          FilterChip(
            label: Text(
              'suíte com acessibilidade',
              style: GoogleFonts.urbanist(),
            ),
            onSelected: (bool value) {},
          )
        ]));
  }
}
