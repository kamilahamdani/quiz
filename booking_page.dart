import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Booking consultation",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Our specialists",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              _buildSpecialistRow(),
              const SizedBox(height: 20),
              _buildCalendarSection(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Dibuat oleh: Kamila Hamdani Lisnawati - 232101104",
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================
  // 🔹 WIDGET: Specialist
  // =====================
  static Widget _buildSpecialistRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildSpecialistCard("Lory Ford", "3 years of experience", "assets/images/lory.png"),
          const SizedBox(width: 10),
          _buildSpecialistCard("Kate Carter", "7 years of experience", "assets/images/kate.png", isSelected: true),
        ],
      ),
    );
  }

  static Widget _buildSpecialistCard(String name, String exp, String imgPath, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB6BA91) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(imgPath, height: 70, width: 70, fit: BoxFit.cover),
            ),
            const SizedBox(height: 5),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(exp, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  // =====================
  // 🔹 WIDGET: Calendar
  // =====================
  static Widget _buildCalendarSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFB6BA91),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "June 2022",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          _buildCalendarRow(["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]),
          _buildCalendarRow(["1", "2", "3", "4", "5", "6", "7"]),
          _buildCalendarRow(["8", "9", "10", "11", "12", "13", "14"]),
          _buildCalendarRow(["15", "16", "17", "18", "19", "20", "21"], highlight: "17"),
          _buildCalendarRow(["22", "23", "24", "25", "26", "27", "28"]),
          _buildCalendarRow(["29", "30"]),
          const SizedBox(height: 15),
          const Text(
            "Select time",
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildTimeRow(),
        ],
      ),
    );
  }

  static Widget _buildCalendarRow(List<String> days, {String? highlight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((day) {
          final isHighlighted = (day == highlight);
          return Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.orange : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              day,
              style: TextStyle(
                color: isHighlighted ? Colors.white : Colors.black,
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  static Widget _buildTimeRow() {
    final times = ["9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.map((time) {
        final isSelected = (time == "10:00 AM");
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
