require 'openssl'
require 'base64'

keys_array = ["Betts", "Chase", "Cook", "Cummings", "Eaton", "England", "Fountain", "Franklin", "Higgins", "Huynh", "Irwin", "Lugo", "Nixon", "Rennie", "Rodrigues", "Ross"]

keys_array.each do |value|
  key = File.open("#{value}_private_key.pem")
  private_key = OpenSSL::PKey::RSA.new(File.read(key))

  y = 0

  while y == 256
    file = File.open("mensagem_#{x}_decoded.txt")
    file_data = file.read
    string = private_key.private_decrypt(file_data)
    File.write("decrypted_messages.txt", string, mode: "a")
    file.close
  end
end


