# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  prerequisites_hash = build_prerequisites_hash(prerequisites)
  courses_need_prerequisites = prerequisites_hash.keys
  courses_dont_need_prerequisites = prerequisites_hash.values.flatten.uniq - courses_need_prerequisites

  while courses_need_prerequisites.size > 0
    course_id = courses_need_prerequisites.detect do |course_id|
      other_need_prerequisites = prerequisites_hash[course_id] - courses_dont_need_prerequisites
      other_need_prerequisites.size == 0
    end

    if course_id.nil?
      return []
    else
      courses_dont_need_prerequisites << course_id
      courses_need_prerequisites = courses_need_prerequisites - [course_id]
    end

    if courses_dont_need_prerequisites.size > num_courses
      return []
    end
    
  end

  return courses_dont_need_prerequisites
end

def build_prerequisites_hash(prerequisites)
  prerequisites.inject({}) do |result, prerequisite|
    if result[prerequisite[0]]
      result[prerequisite[0]] << prerequisite[1]
    else
      result[prerequisite[0]] = [prerequisite[1]]
    end
    result
  end
end
