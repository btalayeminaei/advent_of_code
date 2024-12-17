class DiskMap
  attr_reader :disk
  def initialize(value)
    @disk = []
    id = 0
    (0...value.length).step(2).each do |i|
      file_size = value[i].to_i
      if file_size > 0
        @disk << Array.new(file_size) { id.to_s }
        id += 1
      end
      space_size = value[i+1].to_i
      if space_size > 0
        @disk << Array.new(space_size) { "." }
      end
    end
  end

  def checksum
    compacted_blocks.map.with_index do |value, index|
      index * value.to_i
    end.sum
  end

  private

  def compacted_blocks
    new_disk = disk.map(&:clone)
    j = new_disk.count - 1
    while j > 0 do
      if new_disk[j][0] != "."
        i = 0
        while i < j do
          if new_disk[i][0] == "." && new_disk[i].size >= new_disk[j].size
            free_size = new_disk[i].size
            file_size = new_disk[j].size
            to_use = new_disk[i][0, file_size]
            rem = new_disk[i][file_size, free_size]
            new_disk[i] = new_disk[j]
            new_disk[j] = to_use
            if !rem.empty?
              new_disk.insert(i + 1, rem)
              j += 1
            end
            break
          end
          i += 1
        end
      end
      j -= 1
    end
    new_disk.flatten
  end
end
