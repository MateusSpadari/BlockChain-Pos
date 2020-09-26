require "base64"
require 'openssl'

mensagens = Array.new

Dir[ '*' ].select { |f| mensagens.push(f) }

mensagens.each do |n|
  if n.include? "decoder"
    next
  end
  file = File.open(n)
  file_data = file.read
  plain = Base64.decode64(file_data)
  File.write("mensagem_#{n.scan(/\d/).join('')}_decoded.txt", plain)
  file.close
end

