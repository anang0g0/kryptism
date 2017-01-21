
require 'openssl'
include OpenSSL::PKey


def rsa()

rsa = RSA.generate(2048)
#これで、RSAを作成出来た。


#rsaには、公開鍵（錠）と暗号鍵（鍵）が含まれている。
#公開鍵（錠）は、そのままテキストで取り出し。

public_key = rsa.public_key.to_s

#暗号鍵(鍵）は、AESで暗号化し（パスワード付け）て取りだし。
private_key = rsa.export(OpenSSL::Cipher::Cipher.new('aes256'),'password')

#さて、ここで特定の文字列を暗号化してみる。対象はこれね。
target = 'hogehoge'

#まずは、public_keyから公開鍵（錠）のrsaオブジェクト作成
pub = RSA.new(public_key)

#さあ、暗号化。
for i in 0..100000
enc_target = pub.public_encrypt(target);
#print enc_target;
#target=enc_target;
end
#これで、targetを暗号化出来ました。
#たしかに、’hogehoge’という文字列はみるかげもありません。

#ちなみに、enc_targetはStringのようです。

end


rsa();

