import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfGeneratorScreen extends StatelessWidget {
  const PdfGeneratorScreen({super.key});

  Future<void> generatePDF(BuildContext context) async {
    final pdf = pw.Document();

    List<String> tractorChecklist = [
      "Air Compressor",
      "Battery",
      "Body",
      "Brakes, Parking",
      "Defroster",
      "Fifth Wheel",
      "Engine",
      "Frame",
      "Horn",
      "Mirrors",
      "Oil Pressure",
      "Safety Equipment",
      "Steering",
      "Suspension",
      "Tire Chains",
      "Wheels & Rims",
      "Windshield Wipers"
    ];

    List<String> trailerChecklist = [
      "Connections",
      "Doors",
      "Reflectors",
      "Hitch",
      "Tires",
      "Landing Gear",
      "Safety Equipment",
      "Brakes, Service",
      "Wheels & Rims",
      "Fluid Levels",
      "Fluid Levels"
    ];

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(15),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              //HEADLINE TEXT--->>
              pw.Center(
                child: pw.Text(
                  "Driver's Vehicle Inspection",
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Center(
                child: pw.Text(
                  "As required by the D.O.T Federal motor carrier safety regulations",
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
              pw.Divider(),
              pw.SizedBox(height: 5),

              //INFORMATION OF DRIVEER--->>
              pw.Text("Name:"),
              pw.SizedBox(height: 5),
              pw.Text("Address:"),
              pw.SizedBox(height: 5),
              pw.Text("Carrier:"),
              pw.SizedBox(height: 5),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Start Time:"),
                  pw.Text("End Time:"),
                ],
              ),
              pw.SizedBox(height: 5),
              pw.Text("Date: "),
              pw.SizedBox(height: 5),

              //TRUCK NO & TRUCK CATEGORY--->>
              pw.Divider(thickness: 0.1, color: PdfColors.grey),

              pw.SizedBox(height: 5),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Truck No: "),
                  pw.Text("Odometer Reading: "),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text("Truck Category: "),
              pw.SizedBox(height: 5),

              pw.Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tractorChecklist.map((item) {
                  return pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 5, vertical: 4),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey, width: 0.1),
                      borderRadius: pw.BorderRadius.circular(2),
                    ),
                    child: pw.Text(item, style: pw.TextStyle(fontSize: 8)),
                  );
                }).toList(),
              ),

              pw.SizedBox(height: 10),
              pw.Text(
                "Trailer No :",
              ),
              pw.SizedBox(height: 10),
              pw.Text("Trailer Category: "),
              pw.SizedBox(height: 5),

              pw.Wrap(
                spacing: 10,
                runSpacing: 10,
                children: trailerChecklist.map((item) {
                  return pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 5, vertical: 4),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey, width: 0.1),
                      borderRadius: pw.BorderRadius.circular(2),
                    ),
                    child: pw.Text(item, style: pw.TextStyle(fontSize: 8)),
                  );
                }).toList(),
              ),

              pw.SizedBox(height: 10),
              pw.Text(
                "Remarks: ",
              ),
              pw.SizedBox(height: 10),

              pw.Text('CONDITION OF THE ABOVE VEHICLE IS SETISFACTORY',
                  style: pw.TextStyle(fontSize: 12)),
              pw.SizedBox(height: 5),
              pw.Text('ABOVE DEFECTS CORRECTED',
                  style: pw.TextStyle(fontSize: 12)),
              pw.SizedBox(height: 5),
              pw.Text(
                  'ABOVE DEFECTS NEED NOTE BE CORRECTED FOR SAFE OPERATION OF VEHICLE',
                  style: pw.TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/vehicle_inspection.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      OpenFile.open(filePath);
   
    } catch (e) {
      

      log('Error saving PDF: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Generator')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => generatePDF(context),
          child: Text('Generate PDF'),
        ),
      ),
    );
  }
}
