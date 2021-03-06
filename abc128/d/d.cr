n,k = read_line.split.map(&.to_i)
v_origin = read_line.split.map(&.to_i)
# p n,k
# p v_origin
results = [] of Int32
(k+1).times do |r| # 右から
  (k+1).times do |l| # 左から
    next if r+l > k
    v = v_origin.dup
    # p [l,r]
    queue = [] of Int32
    r.times do
      queue << v.pop unless v.empty?
    end
    l.times do
      queue << v.shift unless v.empty?
    end
    queue.sort!.reverse!
    # p queue

    (k-(r+l)).times do
      if queue.empty? || queue[-1] >= 0
        break
      else
        queue.pop
      end
    end
    # p queue

    if queue.empty?
      results << 0
    else
      results << queue.reduce{|m,i|m+i}
      queue.reduce{|m,i|m+i}
    end
  end
end
p results.empty? ? 0 : results.max
# 14 44 0 50 0
