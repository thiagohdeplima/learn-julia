module SearchAlg
  export binary

  """
      binary(target, items)

  Performs binary search for `target` in `items`.

  # Examples
  ```julia-repl
  julia> SearchAlg.binary(3, [1, 2, 3, 5, 7])
  (3, 3)
  ```
  """
  function binary(target::Any, items::Array)
    min = 1
    max = length(items)

    iteractions = 1

    while min <= max
      candidate = trunc(Int, floor(min + max) / 2)

      println("#$(iteractions) -> Searching $(target) in $(candidate) with range $(min)..$(max)")

      if items[candidate] == target
        return (candidate, items[candidate])
      end

      if items[candidate] < target
        min = candidate + 1
      else
        max = candidate - 1
      end

      iteractions += 1
    end

    return (0, nothing)
  end

  """
    binary(target, items)

  Performs binary search for `target` in `items`.

  # Examples
  ```julia-repl
  julia> SearchAlg.linear(5, [1, 2, 3, 5, 7])
  (5, 4)
  """
  function linear(target::Any, items::Array)
    for index in 1:length(items)
      if items[index] == target
        return (index, items[index])
      end
    end

    return (0, nothing)
  end
end
