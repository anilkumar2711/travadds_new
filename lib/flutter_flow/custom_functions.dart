import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String finalAmount(
  String freq,
  String duration,
  DateTime startDate,
  DateTime endDate,
) {
  int screens = 500;
  double amount = 0.14;

  int days = endDate.difference(startDate).inDays;

  double totalAmount =
      double.parse(freq) * double.parse(duration) * screens * amount * days;

  return totalAmount.toStringAsFixed(2);
}
