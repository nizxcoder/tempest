import 'package:flutter/material.dart';

class AppColors {
  static const Color bgStart = Color.fromRGBO(34, 36, 42, 1);
  static const Color bgMiddle = Color.fromRGBO(43, 47, 52, 1);
  static const Color bgEnd = Color.fromRGBO(28, 29, 32, 1);
  static const Color textColor = Color.fromRGBO(137, 140, 148, 1);
  static const Color primary = Color.fromRGBO(57, 62, 66, 1);
  static const Color secondary = Color.fromRGBO(234, 96, 31, 1);
}

class AppSvg {
  static const String sunIcon =
      '''<svg width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M14 32C14 22.0786 22.0786 14 32 14C41.9214 14 50 22.0786 50 32C50 41.9214 41.9214 50 32 50C22.0786 50 14 41.9214 14 32ZM16.0014 32C16.0014 40.823 23.1769 47.9986 32 47.9986C40.823 47.9986 47.9986 40.823 47.9986 32C47.9986 23.1769 40.823 16.0014 32 16.0014C23.1769 16.0014 16.0014 23.1769 16.0014 32Z" fill="white"/>
<rect x="31" width="2" height="11" fill="white"/>
<rect x="31" y="52" width="2" height="11" fill="white"/>
<path d="M21.7817 6L20 6.853L22.2183 13L24 12.147L21.7817 6Z" fill="white"/>
<path d="M40.7765 51L39 51.8497L41.2235 58L43 57.1503L40.7765 51Z" fill="white"/>
<path d="M50.8169 22.3879L56.4543 20.0527L57.2326 21.9318L51.5953 24.2669L50.8169 22.3879Z" fill="white"/>
<path d="M5.75865 41.0624L11.4189 38.7178L12.1973 40.5969L6.53701 42.9415L5.75865 41.0624Z" fill="white"/>
<path d="M5.75811 21.945L6.53647 20.0659L12.1738 22.401L11.3955 24.2801L5.75811 21.945Z" fill="white"/>
<path d="M50.7949 40.5956L51.5733 38.7165L57.2335 41.0611L56.4552 42.9402L50.7949 40.5956Z" fill="white"/>
<path d="M41.2183 6L39 12.147L40.7817 13L43 6.853L41.2183 6Z" fill="white"/>
<path d="M22.2235 51L20 57.1503L21.7765 58L24 51.8497L22.2235 51Z" fill="white"/>
<path d="M45.8681 15.6867L53.0499 8.50486L54.488 9.943L47.3062 17.1248L45.8681 15.6867Z" fill="white"/>
<path d="M8.5094 53.0583L15.7088 45.859L17.1469 47.2971L9.94754 54.4965L8.5094 53.0583Z" fill="white"/>
<rect x="52" y="31" width="11" height="2" fill="white"/>
<rect y="31" width="11" height="2" fill="white"/>
<path d="M45.8702 47.3067L47.3086 45.8685L54.491 53.0518L53.0525 54.4901L45.8702 47.3067Z" fill="white"/>
<path d="M8.51355 9.94495L9.95169 8.50681L17.1511 15.7062L15.7129 17.1443L8.51355 9.94495Z" fill="white"/>
</svg>''';
  static const String cloudSunIcon =
      '''<svg width="35" height="30" viewBox="0 0 35 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M32.1752 20.8587C32.1339 18.4129 31.0177 16.2288 29.2815 14.7406C29.688 13.8518 29.9154 12.8873 29.9154 11.9089C29.9154 8.17468 26.877 5.13629 23.1427 5.13629C20.4419 5.13629 18.0236 6.74161 16.9488 9.18058C15.7913 8.74653 14.5443 8.51228 13.2628 8.51228C7.50984 8.51228 2.8248 13.1698 2.8248 18.8952C2.8248 19.5152 2.88681 20.1491 3.00394 20.7829C1.2126 21.4995 0 23.2495 0 25.2062C0 27.8381 2.14961 29.9808 4.79528 29.9808H30.1978C32.8435 29.9808 34.9931 27.8381 34.9931 25.2062C35 23.3253 33.8839 21.6235 32.1752 20.8587ZM23.1427 6.26621C26.2569 6.26621 28.7854 8.80165 28.7854 11.9089C28.7854 12.6461 28.6339 13.3696 28.3583 14.0448C27.0561 13.2042 25.5059 12.715 23.8455 12.715C23.1634 12.715 22.4882 12.7977 21.8268 12.9631C20.8278 11.53 19.498 10.4001 17.9823 9.63531C18.878 7.60283 20.8967 6.26621 23.1427 6.26621ZM4.79528 28.844H30.2047C32.2234 28.844 33.8701 27.2111 33.8701 25.1993C33.8701 22.2229 31.0246 21.6304 31.0246 21.6304C31.0246 21.6304 31.0453 21.031 31.0453 20.9965C31.0453 17.0487 27.814 13.845 23.8455 13.845C22.3986 13.845 21.3376 14.279 21.3376 14.279C21.3376 14.279 18.9262 9.63531 13.2628 9.63531C8.12992 9.63531 3.94783 13.7898 3.94783 18.8883C3.94783 20.4729 4.33366 21.5477 4.33366 21.5477C4.33366 21.5477 1.12303 22.154 1.12303 25.1993C1.12303 27.2111 2.76968 28.844 4.79528 28.844Z" fill="white"/>
<rect x="22.5778" y="0.0585327" width="1.12992" height="3.38976" fill="white"/>
<path d="M14.3633 3.93304L15.1623 3.13392L17.5597 5.53096L16.7607 6.33009L14.3633 3.93304Z" fill="white"/>
<rect x="31.6102" y="11.344" width="3.38976" height="1.12992" fill="white"/>
<path d="M19.56 1.7879L18.5197 2.21507L19.3809 4.30267L20.4281 3.8755L19.56 1.7879Z" fill="white"/>
<path d="M25.8577 3.87549L26.7228 1.78791L27.7666 2.22044L26.9016 4.30802L25.8577 3.87549Z" fill="white"/>
<path d="M30.7479 15.67L31.1805 14.6262L33.268 15.4912L32.8355 16.535L30.7479 15.67Z" fill="white"/>
<path d="M30.7536 8.14996L32.8415 7.2851L33.2739 8.32903L31.186 9.1939L30.7536 8.14996Z" fill="white"/>
<path d="M28.7272 5.5274L31.1242 3.1305L31.9231 3.92947L29.5262 6.32637L28.7272 5.5274Z" fill="white"/>
<path d="M5.64272 18.6885H6.77264C6.77264 15.2643 9.5561 12.4808 12.9803 12.4808V11.3509C8.93602 11.344 5.64272 14.6373 5.64272 18.6885Z" fill="white"/>
</svg>
''';
  static const String cloudIcon =
      '''<svg width="35" height="30" viewBox="0 0 35 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M32.1752 20.8587C32.1339 18.4129 31.0177 16.2288 29.2815 14.7406C29.688 13.8518 29.9154 12.8873 29.9154 11.9089C29.9154 8.17468 26.877 5.13629 23.1427 5.13629C20.4419 5.13629 18.0236 6.74161 16.9488 9.18058C15.7913 8.74653 14.5443 8.51228 13.2628 8.51228C7.50984 8.51228 2.8248 13.1698 2.8248 18.8952C2.8248 19.5152 2.88681 20.1491 3.00394 20.7829C1.2126 21.4995 0 23.2495 0 25.2062C0 27.8381 2.14961 29.9808 4.79528 29.9808H30.1978C32.8435 29.9808 34.9931 27.8381 34.9931 25.2062C35 23.3253 33.8839 21.6235 32.1752 20.8587ZM23.1427 6.26621C26.2569 6.26621 28.7854 8.80165 28.7854 11.9089C28.7854 12.6461 28.6339 13.3696 28.3583 14.0448C27.0561 13.2042 25.5059 12.715 23.8455 12.715C23.1634 12.715 22.4882 12.7977 21.8268 12.9631C20.8278 11.53 19.498 10.4001 17.9823 9.63531C18.878 7.60283 20.8967 6.26621 23.1427 6.26621ZM4.79528 28.844H30.2047C32.2234 28.844 33.8701 27.2111 33.8701 25.1993C33.8701 22.2229 31.0246 21.6304 31.0246 21.6304C31.0246 21.6304 31.0453 21.031 31.0453 20.9965C31.0453 17.0487 27.814 13.845 23.8455 13.845C22.3986 13.845 21.3376 14.279 21.3376 14.279C21.3376 14.279 18.9262 9.63531 13.2628 9.63531C8.12992 9.63531 3.94783 13.7898 3.94783 18.8883C3.94783 20.4729 4.33366 21.5477 4.33366 21.5477C4.33366 21.5477 1.12303 22.154 1.12303 25.1993C1.12303 27.2111 2.76968 28.844 4.79528 28.844Z" fill="white"/>
<path d="M5.64272 18.6885H6.77264C6.77264 15.2643 9.5561 12.4808 12.9803 12.4808V11.3509C8.93602 11.344 5.64272 14.6373 5.64272 18.6885Z" fill="white"/>
</svg>
''';
}