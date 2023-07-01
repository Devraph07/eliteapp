import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

double calculateTotalCost(int total) {
  // calculate weight*unitprice+handlingcharge and output the total
  double weight = 10;
  double unitPrice = 4.95;
  double handlingCharge = 15.0;
  double totalCost = (weight * unitPrice) + handlingCharge;
  return totalCost;
}
