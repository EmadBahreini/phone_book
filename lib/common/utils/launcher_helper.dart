import 'package:easy_localization/easy_localization.dart';

import 'package:phone_book/common/ui/toast.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logs/log.dart';

class LauncherHelper {
  static Future<void> launchLink(String? link, {bool inAppWebView = false}) async {
    try {
      if (link != null || link!.isNotEmpty) {
        final uri = Uri.parse(link);
        launchUrl(
          uri,
          mode: inAppWebView ? LaunchMode.inAppWebView : LaunchMode.externalApplication,
        );
      } else {
        Toast.show('open_link_error'.tr());
      }
    } catch (e) {
      Log().errorLog(e);
    }
  }

  static Future<void> launchCall(String? number) async {
    try {
      if (number?.isNotEmpty ?? false) {
        final Uri callUri = Uri(
          scheme: 'tel',
          path: number,
        );
        launchUrl(callUri);
      } else {
        Toast.show('phone_error'.tr());
      }
    } catch (e) {
      Log().errorLog(e);
    }
  }

  static Future<void> launchSMS(String? number) async {
    try {
      if (number?.isNotEmpty ?? false) {
        final Uri smsUri = Uri(
          scheme: 'sms',
          path: number,
        );
        launchUrl(smsUri);
      } else {
        Toast.show('phone_error'.tr());
      }
    } catch (e) {
      Log().errorLog(e);
    }
  }

  static Future<void> launchEmail(String? emailAddress) async {
    try {
      if (emailAddress != null || emailAddress!.isNotEmpty) {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: emailAddress,
        );
        launchUrl(emailLaunchUri);
      } else {
        Toast.show('Email address is invalid'.tr());
      }
    } catch (e) {
      Log().errorLog(e);
    }
  }
}
