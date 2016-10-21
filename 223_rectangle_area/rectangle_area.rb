# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  area_1 = compute_rectangle_area(a, b, c, d)
  area_2 = compute_rectangle_area(e, f, g, h)
  x1, x2 = overlap_section(a, c, e, g)
  y1, y2 = overlap_section(b, d, f, h)
  overlap_area = compute_rectangle_area(x1, y1, x2, y2)
  area_1 + area_2 - overlap_area
end


def compute_rectangle_area(a, b, c, d)
  (a - c).abs * (b - d).abs
end


def overlap_section(a, c, e, g)
  first_min = [a, c].min
  first_max = [a, c].max

  second_min = [e, g].min
  second_max = [e, g].max

  if second_min >= first_max || second_max <= first_min
    return [ 0, 0 ]
  else
    return [ [first_min, second_min].max, [first_max, second_max].min ]
  end
end