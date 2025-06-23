def edge_generator((a,b))
  edges = [
    [a - 2, b - 1],
    [a - 1, b - 2],
    [a + 1, b - 2],
    [a + 2, b - 1],
    [a + 2, b + 1],
    [a + 1, b + 2],
    [a - 1, b + 2],
    [a - 2, b + 1]
  ]

  valid_edges = edges.select {|edge| edge.all? {|e| (0..7).include?e}}

  return valid_edges
end

def breadth_first(start, finish)
  visited_nodes = []
  queue = []

  visited_nodes << start
  queue << start

  until queue.empty?
    current = queue.shift
    puts "[#{current.join(",")}]"
    edge_generator(current).each do |neighbour|
      unless visited_nodes.include? neighbour
        visited_nodes << neighbour
        queue << neighbour
      end
    end
  end
end

breadth_first([3,4], [4,2])
puts [" "," "]
puts edge_generator [1,3]