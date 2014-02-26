animals = [
  {type: "dog", a: 2},
  {type: "dog", b: 7},
  {type: "dog", c: 2},
  {type: "cat", d: 3},
  {type: "cat", e: 4},
  {type: "cat", f: 0},
  {type: "rabbit", g: 0},
  {type: "rabbit", h: 1}
]



animals = animals.group_by do |inner_hash|
  inner_hash[:type]
end
puts animals.map { |_,v| puts _; v.reduce(:merge) }
