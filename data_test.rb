#!/usr/bin/env ruby

require 'date'

p Date.new(2001,2,3)
 #=> #<Date: 2001-02-03 ...>
p Date.jd(2451944)
 #=> #<Date: 2001-02-03 ...>
p Date.ordinal(2001,34)
 #=> #<Date: 2001-02-03 ...>
p Date.commercial(2001,5,6)
 #=> #<Date: 2001-02-03 ...>
p Date.parse('2001-02-03')
 #=> #<Date: 2001-02-03 ...>
p Date.strptime('03-02-2001', '%d-%m-%Y')
 #=> #<Date: 2001-02-03 ...>
p Time.new(2001,2,3).to_date
 #=> #<Date: 2001-02-03 ...>


d = Date.parse('3rd Feb 2001')
                             #=> #<Date: 2001-02-03 ...>
p d.year                       #=> 2001
p d.mon                        #=> 2
p d.mday                       #=> 3
p d.wday                       #=> 6
p d += 1                       #=> #<Date: 2001-02-04 ...>
p d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"




d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
                     #=> #<DateTime: 2001-02-03T04:05:06+03:30 ...>
p d.hour               #=> 4
p d.min                #=> 5
p d.sec                #=> 6
p d.offset             #=> (7/48)
p d.zone               #=> "+03:30"
p d += Rational('1.5')
                     #=> #<DateTime: 2001-02-04%16:05:06+03:30 ...>
p d = d.new_offset('+09:00')
                     #=> #<DateTime: 2001-02-04%21:35:06+09:00 ...>
p d.strftime('%I:%M:%S %p')
                     #=> "09:35:06 PM"
p d > DateTime.new(1999)
                     #=> true



p Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000')  #=> #<Date: 2001-02-03 ...>


# ruby  javascript 之间日期传递
t = Time.now
p t # => 2014-03-12 11:18:29 -0700
p t.to_f * 1000 # convert to milliseconds since 1970-01-01 00:00:00 UTC.
# # => 1394648309130.185
# This value can be directly given to the JavaScript Date constructor:
#
# var d = new Date(1394648309130.185)
# d // Wed Mar 12 2014 11:18:29 GMT-0700 (Pacific Daylight Time)
#
# d.getTime()
# // 1394648309130 // Fractions of a millisecond are dropped
# Take that value, divide by 1000, and give it to ruby:
#
p Time.at( 1394648309130 / 1000.0 )
# # => 2014-03-12 11:18:29 -0700



=begin
Formats date according to the directives in the given format
string.
The directives begins with a percent (%) character.
Any text not listed as a directive will be passed through to the
output string.

The directive consists of a percent (%) character,
zero or more flags, optional minimum field width,
optional modifier and a conversion specifier
as follows.

  %<flags><width><modifier><conversion>

Flags:
  -  don't pad a numerical output.
  _  use spaces for padding.
  0  use zeros for padding.
  ^  upcase the result string.
  #  change case.

The minimum field width specifies the minimum width.

The modifiers are "E", "O", ":", "::" and ":::".
"E" and "O" are ignored.  No effect to result currently.

Format directives:

  Date (Year, Month, Day):
    %Y - Year with century (can be negative, 4 digits at least)
            -0001, 0000, 1995, 2009, 14292, etc.
    %C - year / 100 (round down.  20 in 2009)
    %y - year % 100 (00..99)

    %m - Month of the year, zero-padded (01..12)
            %_m  blank-padded ( 1..12)
            %-m  no-padded (1..12)
    %B - The full month name (``January'')
            %^B  uppercased (``JANUARY'')
    %b - The abbreviated month name (``Jan'')
            %^b  uppercased (``JAN'')
    %h - Equivalent to %b

    %d - Day of the month, zero-padded (01..31)
            %-d  no-padded (1..31)
    %e - Day of the month, blank-padded ( 1..31)

    %j - Day of the year (001..366)

  Time (Hour, Minute, Second, Subsecond):
    %H - Hour of the day, 24-hour clock, zero-padded (00..23)
    %k - Hour of the day, 24-hour clock, blank-padded ( 0..23)
    %I - Hour of the day, 12-hour clock, zero-padded (01..12)
    %l - Hour of the day, 12-hour clock, blank-padded ( 1..12)
    %P - Meridian indicator, lowercase (``am'' or ``pm'')
    %p - Meridian indicator, uppercase (``AM'' or ``PM'')

    %M - Minute of the hour (00..59)

    %S - Second of the minute (00..59)

    %L - Millisecond of the second (000..999)
    %N - Fractional seconds digits, default is 9 digits (nanosecond)
            %3N  millisecond (3 digits)   %15N femtosecond (15 digits)
            %6N  microsecond (6 digits)   %18N attosecond  (18 digits)
            %9N  nanosecond  (9 digits)   %21N zeptosecond (21 digits)
            %12N picosecond (12 digits)   %24N yoctosecond (24 digits)

  Time zone:
    %z - Time zone as hour and minute offset from UTC (e.g. +0900)
            %:z - hour and minute offset from UTC with a colon (e.g. +09:00)
            %::z - hour, minute and second offset from UTC (e.g. +09:00:00)
            %:::z - hour, minute and second offset from UTC
                                              (e.g. +09, +09:30, +09:30:30)
    %Z - Time zone abbreviation name or something similar information.

  Weekday:
    %A - The full weekday name (``Sunday'')
            %^A  uppercased (``SUNDAY'')
    %a - The abbreviated name (``Sun'')
            %^a  uppercased (``SUN'')
    %u - Day of the week (Monday is 1, 1..7)
    %w - Day of the week (Sunday is 0, 0..6)

  ISO 8601 week-based year and week number:
  The week 1 of YYYY starts with a Monday and includes YYYY-01-04.
  The days in the year before the first week are in the last week of
  the previous year.
    %G - The week-based year
    %g - The last 2 digits of the week-based year (00..99)
    %V - Week number of the week-based year (01..53)

  Week number:
  The week 1 of YYYY starts with a Sunday or Monday (according to %U
  or %W).  The days in the year before the first week are in week 0.
    %U - Week number of the year.  The week starts with Sunday.  (00..53)
    %W - Week number of the year.  The week starts with Monday.  (00..53)

  Seconds since the Unix Epoch:
    %s - Number of seconds since 1970-01-01 00:00:00 UTC.
    %Q - Number of milliseconds since 1970-01-01 00:00:00 UTC.

  Literal string:
    %n - Newline character (\n)
    %t - Tab character (\t)
    %% - Literal ``%'' character

  Combination:
    %c - date and time (%a %b %e %T %Y)
    %D - Date (%m/%d/%y)
    %F - The ISO 8601 date format (%Y-%m-%d)
    %v - VMS date (%e-%b-%Y)
    %x - Same as %D
    %X - Same as %T
    %r - 12-hour time (%I:%M:%S %p)
    %R - 24-hour time (%H:%M)
    %T - 24-hour time (%H:%M:%S)
    %+ - date(1) (%a %b %e %H:%M:%S %Z %Y)

This method is similar to strftime() function defined in ISO C and POSIX.
Several directives (%a, %A, %b, %B, %c, %p, %r, %x, %X, %E*, %O* and %Z)
are locale dependent in the function.
However this method is locale independent.
So, the result may differ even if a same format string is used in other
systems such as C.
It is good practice to avoid %x and %X because there are corresponding
locale independent representations, %D and %T.

Examples:

  d = DateTime.new(2007,11,19,8,37,48,"-06:00")
                            #=> #<DateTime: 2007-11-19T08:37:48-0600 ...>
  d.strftime("Printed on %m/%d/%Y")   #=> "Printed on 11/19/2007"
  d.strftime("at %I:%M%p")            #=> "at 08:37AM"

Various ISO 8601 formats:
  %Y%m%d           => 20071119                  Calendar date (basic)
  %F               => 2007-11-19                Calendar date (extended)
  %Y-%m            => 2007-11                   Calendar date, reduced accuracy, specific month
  %Y               => 2007                      Calendar date, reduced accuracy, specific year
  %C               => 20                        Calendar date, reduced accuracy, specific century
  %Y%j             => 2007323                   Ordinal date (basic)
  %Y-%j            => 2007-323                  Ordinal date (extended)
  %GW%V%u          => 2007W471                  Week date (basic)
  %G-W%V-%u        => 2007-W47-1                Week date (extended)
  %GW%V            => 2007W47                   Week date, reduced accuracy, specific week (basic)
  %G-W%V           => 2007-W47                  Week date, reduced accuracy, specific week (extended)
  %H%M%S           => 083748                    Local time (basic)
  %T               => 08:37:48                  Local time (extended)
  %H%M             => 0837                      Local time, reduced accuracy, specific minute (basic)
  %H:%M            => 08:37                     Local time, reduced accuracy, specific minute (extended)
  %H               => 08                        Local time, reduced accuracy, specific hour
  %H%M%S,%L        => 083748,000                Local time with decimal fraction, comma as decimal sign (basic)
  %T,%L            => 08:37:48,000              Local time with decimal fraction, comma as decimal sign (extended)
  %H%M%S.%L        => 083748.000                Local time with decimal fraction, full stop as decimal sign (basic)
  %T.%L            => 08:37:48.000              Local time with decimal fraction, full stop as decimal sign (extended)
  %H%M%S%z         => 083748-0600               Local time and the difference from UTC (basic)
  %T%:z            => 08:37:48-06:00            Local time and the difference from UTC (extended)
  %Y%m%dT%H%M%S%z  => 20071119T083748-0600      Date and time of day for calendar date (basic)
  %FT%T%:z         => 2007-11-19T08:37:48-06:00 Date and time of day for calendar date (extended)
  %Y%jT%H%M%S%z    => 2007323T083748-0600       Date and time of day for ordinal date (basic)
  %Y-%jT%T%:z      => 2007-323T08:37:48-06:00   Date and time of day for ordinal date (extended)
  %GW%V%uT%H%M%S%z => 2007W471T083748-0600      Date and time of day for week date (basic)
  %G-W%V-%uT%T%:z  => 2007-W47-1T08:37:48-06:00 Date and time of day for week date (extended)
  %Y%m%dT%H%M      => 20071119T0837             Calendar date and local time (basic)
  %FT%R            => 2007-11-19T08:37          Calendar date and local time (extended)
  %Y%jT%H%MZ       => 2007323T0837Z             Ordinal date and UTC of day (basic)
  %Y-%jT%RZ        => 2007-323T08:37Z           Ordinal date and UTC of day (extended)
  %GW%V%uT%H%M%z   => 2007W471T0837-0600        Week date and local time and difference from UTC (basic)
  %G-W%V-%uT%R%:z  => 2007-W47-1T08:37-06:00    Week date and local time and difference from UTC (extended)
=end
