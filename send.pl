# 剽窃しますた
# Client side script
#
use strict;
use warnings;
use utf8;
use Carp ( );
use Encode ( );
use IO::Socket;

# コンストラクタ
my $socket = IO::Socket::INET->new(
    PeerAddr => 'localhost',  # 接続先
    PeerPort => 2525,         # Port 番号
    Proto    => 'tcp',        # Protocol
    TimeOut  => 5             # タイムアウト時間
);

Carp::croak "Could not create socket: $!" unless $socket;

my $encoder = Encode::find_encoding('utf8');
while(1){
    # STDIN からメッセージ受信
    print '> ';
    my $msg = <STDIN>;

    # Perl 内部文字列にデコード
    $msg = $encoder->decode($msg);

    # 行末の改行を削除
    $msg =~ s/\x0D?\x0A?$//;

    # 外部文字にエンコードしてサーバに送信
    print $socket $encoder->encode($msg), "\n";

    # Socket からメッセージを受信
    $msg = <$socket>;

    # Perl 内部文字列にデコード
    $msg = $encoder->decode($msg);

    # QUIT 受信で終了
    if ($msg =~ m/^QUIT$/i) {
        $socket->close;
        print "Connection closed by foreign host.\n";
        last;
    }

    # 外部文字にエンコードし表示
    print $encoder->encode($msg);
}
