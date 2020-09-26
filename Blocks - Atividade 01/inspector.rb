
keys = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
array_data = Array.new

keys.each do |n|
  file = File.open("bloco_#{n+1}.txt")
  file_data = file.read
  array_data.push(file_data)
  file.close

  if array_data[n].split().last.include? "Vazio"
    puts "bloco #{n+1} correto."
  elsif array_data[n].split().last.eql? array_data[n-1].split("\n")[3].match(/\b[a-f0-9]{64}\b/).to_s
    puts "bloco #{n+1} correto."
  else
    puts "bloco #{n+1} incorreto."
  end
end


