# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  order = []

  # adjacency list
  adjacency_list = build_adjacency_list(num_courses, prerequisites)

  visited_flag = (0...num_courses).map {|i| false }
  is_loop_flag = (0...num_courses).map {|i| false }

  (0...num_courses).each do |course_id|
    if(!visit(course_id, adjacency_list, order, visited_flag, is_loop_flag)) 
      return []
    end
  end

  return order
end

def visit(course_id, adjacency_list, order, visited_flag, is_loop_flag)
  return true if visited_flag[course_id]
  return false if is_loop_flag[course_id]

  is_loop_flag[course_id] = true
  adjacency_list[course_id].each do |downstream_course_id|
    return false if(!visit(downstream_course_id, adjacency_list, order, visited_flag, is_loop_flag))
  end

  order << course_id
  is_loop_flag[course_id] = false
  visited_flag[course_id] = true
  return true
end

def build_adjacency_list(num_courses, prerequisites)
  adjacency_list = (0...num_courses).map {|i| []}

  prerequisites.each do |prerequisite|
    adjacency_list[prerequisite[0]] << prerequisite[1]
  end
  adjacency_list
end

find_order(2, [[1,0]])
