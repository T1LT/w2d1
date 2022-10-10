# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.length == 0
        self.sum % self.length == 0 ? self.sum / self.length : self.sum / (1.0 * self.length)
    end

    def median
        return nil if self.length == 0
        temp = self.sort
        if temp.length.odd?
            return temp[temp.length / 2]
        end
        if (temp[temp.length / 2] + temp[(temp.length / 2) - 1]).even?
            return (temp[temp.length / 2] + temp[(temp.length / 2) - 1]) / 2
        end
        (temp[temp.length / 2] + temp[(temp.length / 2) - 1]) / (2.0)
    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1 }
        hash
    end

    def my_count(value)
        count = 0
        self.each { |el| count += 1 if el == value }
        count
    end

    def my_index(value)
        self.each_with_index do |el, idx|
            return idx if el == value
        end
        nil
    end

    def my_uniq
        hash = {}
        self.each { |el| hash[el] = true }
        hash.keys
    end

    def my_transpose
        res = Array.new(self.length) { Array.new([]) }
        i, j = 0, 0
        while i < self.length
            while j < self.length
                res[i][j] = self[j][i]
                j += 1
            end
            j = 0
            i += 1
        end
        res
    end
end
