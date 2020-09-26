require "base64"
require 'openssl'

x = 0

while x >= 256
  file = File.open("mensagem_#{x}.txt")
  file_data = file.read
  plain = Base64.decode64(file_data)
  File.write("mensagem_#{x}_decoded.txt", file_data)
  file.close
end

