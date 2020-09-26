require 'openssl'
require 'base64'

keys_array = ["Betts", "Chase", "Cook", "Cummings", "Eaton", "England", "Fountain", "Franklin", "Higgins", "Huynh", "Irwin", "Lugo", "Nixon", "Rennie", "Rodrigues", "Ross"]

keys_array.each do |value|
  key = File.open("#{value}_private_key.pem")
  private_key = OpenSSL::PKey::RSA.new(File.read(key))

  Dir[ '../Mensagens/*' ].select do |f|
    if f.include? "decoder"
      next
    end

    if f.include? "decoded"
      begin
        file = File.open(f)
        file_data = file.read
        string = private_key.private_decrypt(file_data)
      rescue => exception
        next
      else
        File.write("decrypted_messages.txt", string + "\n", mode: "a")
        file.close
      end
    end
  end
end

puts "Novo arquivo 'decrypted_messages.txt' criado. "


