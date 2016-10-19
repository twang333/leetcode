# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  result = []
  overlapped_index_marker = []
  intervals.each_with_index do |interval, index|
    if is_overlapped?(interval, new_interval)
      overlapped_index_marker << index
    else
      result << interval
    end
  end

  if overlapped_index_marker.size > 0
    interval_to_create = Interval.new
    interval_to_create.start = [intervals[overlapped_index_marker.first].start, new_interval.start].min
    interval_to_create.end = [intervals[overlapped_index_marker.last].end, new_interval.end].max
    result.insert(overlapped_index_marker.first, interval_to_create)
  else
    result.each_with_index do |interval, index|
      if interval.start > new_interval.end
        result.insert(index, new_interval)
        break
      end
    end
    if result.size == intervals.size
      result.push(new_interval)
    end
  end

  return result

end

def is_overlapped?(interval_1, interval_2)
  if interval_1.end < interval_2.start || interval_1.start > interval_2.end
    false
  else
    true
  end
end

# class Interval
#   attr_accessor :start, :end
#   def initialize(s=0, e=0)
#     @start = s
#     @end = e
#   end

#   def ==(interval)
#     self.start == interval.start && self.end == interval.end
#   end
# end

# p [Interval.new(1,2)] == insert([], Interval.new(1,2))
# p [Interval.new(-2,-1),Interval.new(1,3)] == insert([Interval.new(1,3)],Interval.new(-2,-1))
# p [Interval.new(1,3),Interval.new(5,6)] == insert([Interval.new(1,3)],Interval.new(5,6))
# p [Interval.new(1,5),Interval.new(6,9)] == insert([Interval.new(1,3),Interval.new(6,9)],Interval.new(2,5))
# p [Interval.new(1,2),Interval.new(3,10),Interval.new(12,16)] == insert([Interval.new(1,2),Interval.new(3,5),Interval.new(6,7),Interval.new(8,10),Interval.new(12,16)],Interval.new(4,9))
