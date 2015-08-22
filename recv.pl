#!C\Perl\bin\perl.exe

# 剽窃しますた
# Server side script
#
use strict;
use warnings;
use utf8;
use Carp ( );
use Encode ( );
use IO::Socket;

# コンストラクタ
my $server_socket = IO::Socket::INET->new(
    LocalPort => 2525,  # Port 番号
    Proto     => 'tcp', # Protocol
    Listen    => 1,     # Listen する数
    ReuseAddr => 1,     # なんだろ？ふつーは1だとか (あとでしらべる)
);

Carp::croak "Could not create socket: $!" unless $server_socket;

my $encoder = Encode::find_encoding('utf8');

while(1){
    # クライアントからの接続受付
    my $client_socket = $server_socket->accept;

    while(my $msg = <$client_socket>){
        # Perl 内部文字列にデコード
        $msg = $encoder->decode($msg);

        # 行末の改行を削除
        $msg =~ s/\x0D?\x0A?$//;

        # QUIT 受信で終了
        if ($msg =~ m/^QUIT$/i) {
            print 'Connection closed.';
            last;
        }

        # 受信した文字列を外部文字にエンコードし表示 & クライアントへ送信
        print 'Client>> ', $encoder->encode($msg), "\n";
        print $client_socket 'Server>> ', $encoder->encode($msg), "\n";
    }

    # Socket 閉じる
    $client_socket->close;
}

$server_socket->close;
