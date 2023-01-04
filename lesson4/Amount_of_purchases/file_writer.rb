class FileWriter
  def initialize(mode, name, current_time)
    @filename = "Сheck_#{name}_#{current_time}.txt"
    @mode = mode
  end

  def write(content)
    File.write(@filename, content, mode: @mode)
  end
end
