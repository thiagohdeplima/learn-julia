module Selection
  function run(array::Array)
    for index in 1:length(array)
      minIndex = getMinIndexFrom(array, index)

      if minIndex != index
        array = swap(array, index, minIndex)
      end
    end

    return array
  end

  function swap(array::Array, from::Int, to::Int)
    temp = array[from]

    array[from] = array[to]
    array[to] = temp

    return array
  end

  function getMinIndexFrom(array::Array, fromIndex::Int)
    minIndex = fromIndex
    minValue = array[fromIndex]

    for index in minIndex:length(array)
      if index == minIndex
        continue
      end

      if array[index] < minValue
        minIndex = index
        minValue = array[index]
      end
    end

    return minIndex
  end
end
