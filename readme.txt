ellizyum: unix file cipher by ECC Public-key cryptsystem.
ver 1.0
date:20160208
name:Y.Terasawa

usage: ellizyum inputfile outputfile <RET>
>>input mode (e or d e:encrypt,d:decrypt)<RET>
usage2: elizyum k<RET>
鍵の対を作ります。(file name is eccpub.key/eccsec.key)
相手に暗号化したfileを送る場合は相手の公開鍵を先に入手してください。
for example rename eccpub.key->mypub.key
----------------------------------------------------------
downloadしていただき、有り難うございます。
windowsが壊れてしまったので、Unixで作ってみました。
意外とUnixでfile暗号化って無いんですね。

このcommandは楕円曲線暗号の公開鍵を使って、fileを暗号化します。
一度に１つのfileしか暗号化できないので、沢山のfileを暗号化する場合は
scriptを書いてくださいね。

まだXのapplicationかけるほどprogrammingできません。
codeが欲しいかたはmailください。
ご要望、ご感想なども受付ています。
mail:fumumue@gmail.com
