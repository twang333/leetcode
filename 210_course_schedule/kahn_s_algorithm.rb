# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  return [] if num_courses <= 0
  downstream_course_hash, upstream_course_hash = build_upstream_downstream_course_hash(prerequisites)
  courses_dont_need_prerequisites = (0...num_courses).to_a - upstream_course_hash.keys
  order = []

  while courses_dont_need_prerequisites.size > 0
    course_id = courses_dont_need_prerequisites.shift
    order.push(course_id)

    downstream_course_ids = downstream_course_hash.delete(course_id) || []

    downstream_course_ids.each do |downstream_course_id|
      upstreams = upstream_course_hash[downstream_course_id] || []
      upstream_course_hash[downstream_course_id] = upstreams - [course_id]

      if upstream_course_hash[downstream_course_id].size == 0
        upstream_course_hash.delete(downstream_course_id)
        courses_dont_need_prerequisites << downstream_course_id
      end
    end
  end

  if order.size == num_courses
    return order
  else 
    []
  end

end

def build_upstream_downstream_course_hash(prerequisites)
  downstream_course_hash = {}
  upstream_course_hash = {}
  prerequisites.each do |prerequisite|
    if upstream_course_hash[prerequisite[0]] 
      upstream_course_hash[prerequisite[0]] << prerequisite[1] if !upstream_course_hash[prerequisite[0]].include?(prerequisite[1])
    else
      upstream_course_hash[prerequisite[0]] = [prerequisite[1]]
    end

    if downstream_course_hash[prerequisite[1]] 
      downstream_course_hash[prerequisite[1]] << prerequisite[0] if !downstream_course_hash[prerequisite[1]].include?(prerequisite[0])
    else
      downstream_course_hash[prerequisite[1]] = [prerequisite[0]]
    end
  end

  [downstream_course_hash, upstream_course_hash]
end
