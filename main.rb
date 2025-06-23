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

def shortest_path(start, finish)
  visited_nodes = []
  queue = []
  parents = {}
  path = []

  visited_nodes << start
  queue << start
  path << finish

  until queue.empty?
    current = queue.shift

    if current == finish
        until path.include? start
          path << parents[current]
          current = parents[current]
        end
        move = path.size == 2 ? "move" : "moves"
        puts "you made it in #{path.size - 1} #{move} here's your path"
        for coord in path.reverse
          puts "[#{coord.join(",")}]"
        end
        return
    end

    edge_generator(current).each do |neighbour|
      unless visited_nodes.include? neighbour
        visited_nodes << neighbour
        queue << neighbour
        parents[neighbour] = current 
      end
    end
  end
 return
end

shortest_path([0,0], [7,7])
