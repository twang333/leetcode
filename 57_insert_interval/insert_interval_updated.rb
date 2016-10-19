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

  index = 0
  while index < intervals.size && intervals[index].end < new_interval.start
    result << intervals[index]
    index += 1
  end

  while index < intervals.size && intervals[index].start <= new_interval.end
    new_interval = Interval.new(
      [intervals[index].start, new_interval.start].min,
      [intervals[index].end, new_interval.end].max
      )
    index += 1
  end

  result << new_interval

  while index < intervals.size
    result << intervals[index]
    index += 1
  end

  return result

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
