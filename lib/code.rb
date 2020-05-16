class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  
  def self.valid_pegs?(arr)
    arr.all? {|v| POSSIBLE_PEGS.has_key? v.upcase}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr) 
      @pegs=arr.map(&:upcase)
    else
      raise "error"
    end
  end

  def self.random(num)
    arr=[]
    num.times{ arr << POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.upcase.split(""))
  end


  def [](index)
    @pegs[index]
  end

  def length
    @pegs.size
  end

  def num_exact_matches(instance)
    j=0
    @pegs.each_with_index{|v,i| j+=1 if v==instance[i]}
    j
  end

  def num_near_matches(instance)
    j=0
    @pegs.each_with_index do |v,i| 
      if v!=instance[i] && @pegs.include?(instance[i])
        j+=1 
      end
    
    end
    j
  end

  def == (instance)
    j=0
    @pegs.each_with_index{|v,i| j+=1 if v==instance[i]}
    j==@pegs.size ? true : false
  end
end