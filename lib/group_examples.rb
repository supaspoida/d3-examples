module GroupExamples
  extend self

  def [](file_paths)
    file_paths.map(&to_example).group_by &:type
  end

  def to_example
    Example.method :new
  end
end

class Example < Struct.new(:file_path)
  def components
    file_path.split('/')
  end

  def name
    components[-1][0..-6].gsub '-', ' '
  end

  def path
    components[1..-1] * '/'
  end

  def type
    components[-2].gsub '-', ' '
  end
end
