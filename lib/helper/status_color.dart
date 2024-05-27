import 'package:flutter/material.dart';
import 'package:lahint/utility/app_theme.dart';

enum SectorStatus{
  visits,
  contracts,
  tickets,
  leadsRequests,
  indivRequests
}

class StatusColors{
  static final StatusColors _statusColors = StatusColors._internal();
  factory StatusColors() {
    return _statusColors;
  }
  StatusColors._internal();

 statusColor(SectorStatus sectorStatus, statusCode){
    switch(sectorStatus){
      case SectorStatus.visits:

        break;
      case SectorStatus.contracts:
      return _ticketsColor(statusCode: statusCode);
      case SectorStatus.tickets:
        return _ticketsColor(statusCode: statusCode);
      case SectorStatus.leadsRequests:

        break;
        case SectorStatus.indivRequests:

        break;
      default:

        break;
    }
  }

  _ticketsColor({required statusCode}){
    switch(statusCode){
      case 100000009:
        // closed
      return AppColors.secondaryColor;
      case 100000000:
        // opened
        return const Color(0xff8a9d2a);
      default:
        return AppColors.red;
    }
  }
}