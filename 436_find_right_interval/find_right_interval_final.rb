def find_right_interval(intervals)
  starts = intervals.map.with_index { |interval, i| [interval.start, i] }.sort
  intervals.map { |interval| (starts.bsearch { |s, i| s >= interval.end } || [-1])[-1] }
end