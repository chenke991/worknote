<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1599547656210" ID="ID_392256453" MODIFIED="1600130881421" TEXT="Linux">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1600130888377" ID="ID_1429847293" MODIFIED="1600136408772" POSITION="right" TEXT="&#x5185;&#x5b58;">
<node CREATED="1599547740364" HGAP="57" ID="ID_743474636" MODIFIED="1599551824455" STYLE="bubble" TEXT="&#x5185;&#x6838;&#x4f7f;&#x7528;&#x5185;&#x5b58;&#xff0c;&#x5185;&#x6838;&#x6001;" VSHIFT="-19">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599547985881" HGAP="11" ID="ID_1876816235" MODIFIED="1599551824455" TEXT="&#x5185;&#x5b58;&#x7533;&#x8bf7;" VSHIFT="-60">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599547955600" HGAP="15" ID="ID_1292281580" MODIFIED="1599551922316" TEXT="kmalloc() " VSHIFT="-35">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599550850824" ID="ID_557074558" MODIFIED="1599551824455" TEXT="&#x5206;&#x914d;&#x7684;&#x5185;&#x5b58;&#x662f;&#x8fde;&#x7eed;&#x7684;">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599551129048" ID="ID_882602781" MODIFIED="1599615983721" TEXT="meminfo&#x4e2d;&#x5bf9;&#x5e94;&#x6307;&#x6807;Slab">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599551132257" ID="ID_191872040" MODIFIED="1599551824455" TEXT="SReclaimable">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599551152491" ID="ID_1339552117" MODIFIED="1599551824455" TEXT="&#x5728;&#x5185;&#x5b58;&#x7d27;&#x5f20;&#x7684;&#x65f6;&#x5019;&#x53ef;&#x4ee5;&#x88ab;&#x56de;&#x6536;&#x7684;&#x5185;&#x5b58;">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1599551139873" ID="ID_135514597" MODIFIED="1599551824455" TEXT="SUnreclaim">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599551160594" ID="ID_1841494799" MODIFIED="1599551824455" TEXT="&#x4e0d;&#x53ef;&#x4ee5;&#x88ab;&#x56de;&#x6536;&#x53ea;&#x80fd;&#x4e3b;&#x52a8;&#x91ca;&#x653e;&#x7684;&#x5185;&#x5b58;">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
</node>
</node>
<node CREATED="1599547831992" HGAP="32" ID="ID_1712997467" MODIFIED="1599551925173" TEXT="vmalloc" VSHIFT="-2">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599550863182" HGAP="22" ID="ID_1982738480" MODIFIED="1599555168834" TEXT="&#x5206;&#x914d;&#x7684;&#x5185;&#x5b58;&#x4e0d;&#x4fdd;&#x8bc1;&#x8fde;&#x7eed;" VSHIFT="-24">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599551089642" HGAP="21" ID="ID_178572992" MODIFIED="1599615990890" TEXT="meminfo&#x4e2d;&#x5bf9;&#x5e94;&#x6307;&#x6807;VmallocUsed" VSHIFT="20">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
</node>
<node CREATED="1599548030005" HGAP="35" ID="ID_66362942" MODIFIED="1599551824454" TEXT="&#x5185;&#x5b58;&#x91ca;&#x653e;" VSHIFT="-66">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599548047171" HGAP="15" ID="ID_1555998050" MODIFIED="1599555172749" TEXT="kfree()" VSHIFT="-23">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599548059548" ID="ID_605303677" MODIFIED="1599555175494" TEXT="vfree()" VSHIFT="17">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1599551032246" ID="ID_1432810472" MODIFIED="1599551824454" TEXT="&#x89c2;&#x5bdf;&#x70b9;">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599550494982" HGAP="17" ID="ID_314583870" MODIFIED="1599553942956" TEXT="&#x6cc4;&#x9732;" VSHIFT="62">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599551985713" ID="ID_1262458889" MODIFIED="1599552087098" TEXT="&#x6392;&#x67e5;">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599553865051" HGAP="16" ID="ID_994883261" MODIFIED="1599618689290" TEXT="&#x4e00;&#x822c;&#x65b9;&#x6cd5;" VSHIFT="-22">
<node COLOR="#cc0000" CREATED="1599553620826" ID="ID_549396323" MODIFIED="1599553697853" TEXT="VmallocUsed &#x548c; SUnreclaim &#x592a;&#x5927;&#x6216;&#x6301;&#x7eed;&#x589e;&#x957f;&#x800c;&#x4e0d;&#x4e0b;&#x964d;">
<font BOLD="true" NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599551997594" ID="ID_1019624436" MODIFIED="1599552087097" TEXT="cat /proc/vmallocinfo">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599551994848" ID="ID_115310739" MODIFIED="1599552087098" TEXT="grep -Eo &quot;VmallocUsed|SUnreclaim&quot; /proc/meminfo">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599554094511" ID="ID_1540007064" MODIFIED="1599554100990" TEXT="cat /proc/slabinfo"/>
</node>
<node CREATED="1599553900314" ID="ID_707975175" MODIFIED="1599553905137" TEXT="&#x5de5;&#x5177;">
<node CREATED="1599553906186" HGAP="21" ID="ID_1315099050" MODIFIED="1599555123650" TEXT="kmemleak" VSHIFT="27">
<node CREATED="1599553915865" HGAP="13" ID="ID_758670405" MODIFIED="1599616220308" TEXT="https://www.kernel.org/doc/html/v4.10/dev-tools/kmemleak.html" VSHIFT="-9"/>
<node CREATED="1599554000727" HGAP="27" ID="ID_1968439869" MODIFIED="1599616215662" TEXT="/sys/kernel/debug/kmemleak &#x5206;&#x6790;&#x8fd9;&#x4e2a;&#x6587;&#x4ef6;&#x5185;&#x5bb9;" VSHIFT="19"/>
<node CREATED="1599555125777" ID="ID_1528980438" MODIFIED="1599616211983" TEXT="&#x591a;&#x7528;&#x4e8e;&#x6d4b;&#x8bd5;&#x73af;&#x5883;&#xff0c;&#x56e0;&#x4e3a;&#x5f00;&#x542f;&#x6b64;&#x529f;&#x80fd;&#x4f1a;&#x5f71;&#x54cd;&#x6027;&#x80fd;" VSHIFT="20"/>
</node>
</node>
</node>
<node CREATED="1599616391509" ID="ID_603120493" MODIFIED="1599616398161" TEXT="&#x5371;&#x5bb3;">
<node CREATED="1599616399675" HGAP="16" ID="ID_320260540" MODIFIED="1599618684205" TEXT="&#x751f;&#x547d;&#x5468;&#x671f;&#x662f;&#x4e0e;&#x5185;&#x6838;&#x4e00;&#x81f4;" VSHIFT="-18"/>
<node CREATED="1599551807865" ID="ID_1896077962" MODIFIED="1599551824454" TEXT="&#x53ea;&#x6709;&#x5728;&#x5185;&#x6838;&#x91cd;&#x542f;&#xff08;&#x5373;&#x670d;&#x52a1;&#x5668;&#x91cd;&#x542f;&#xff09;&#x65f6;&#x624d;&#x4f1a;&#x91ca;&#x653e;&#x6389;&#x8fd9;&#x90e8;&#x5206;&#x5185;&#x5b58;">
<font NAME="SansSerif" SIZE="16"/>
</node>
<node CREATED="1599551887688" HGAP="19" ID="ID_692070265" MODIFIED="1599618681589" TEXT="&#x5bb9;&#x6613;&#x51fa;&#x73b0;&#x7684;&#x7a0b;&#x5e8f; &#x7f51;&#x5361;&#x9a71;&#x52a8;&#xff0c;SSD &#x5361;&#x9a71;&#x52a8;&#x7b49;" VSHIFT="12">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
</node>
</node>
<node CREATED="1599547758910" HGAP="124" ID="ID_1132329225" MODIFIED="1600130919386" STYLE="bubble" TEXT="&#x5e94;&#x7528;&#x7a0b;&#x5e8f;&#x4f7f;&#x7528;&#x5185;&#x5b58;&#xff0c;&#x7528;&#x6237;&#x6001;" VSHIFT="-33">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599548007639" ID="ID_1231880045" MODIFIED="1599551824454" TEXT="&#x5185;&#x5b58;&#x7533;&#x8bf7;">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599547882213" HGAP="47" ID="ID_1852076754" MODIFIED="1599551824453" TEXT="malloc() &#x7533;&#x8bf7;" VSHIFT="-27">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599550914851" ID="ID_1574184812" MODIFIED="1599551824453" TEXT="&#x5206;&#x914d;&#x7684;&#x5185;&#x5b58;&#x4e0d;&#x4fdd;&#x8bc1;&#x8fde;&#x7eed; ">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1599616589397" ID="ID_1685795510" MODIFIED="1599616593439" TEXT="mmap&#xff08;MAP_ANON|MAP_SHARED&#xff09;">
<node CREATED="1599617957114" ID="ID_961760686" MODIFIED="1599617970150" TEXT="Shmem">
<node CREATED="1599618480420" ID="ID_1252129361" MODIFIED="1599618514348" TEXT="tmpfs&#x662f;&#x4e00;&#x79cd;&#x7279;&#x6b8a;&#x7684;Shmem,&#x7531;&#x7cfb;&#x7edf;&#x7ba1;&#x7406;&#xff0c;&#x4e0d;&#x4f53;&#x73b0;&#x5728;&#x8fdb;&#x7a0b;&#x5185;&#x5b58;&#x4e2d;"/>
</node>
<node CREATED="1599618410464" ID="ID_1722192252" MODIFIED="1599618417805" TEXT="&#x5c5e;&#x4e8e;&#x8fdb;&#x7a0b;RES"/>
<node CREATED="1599618418342" ID="ID_1569443213" MODIFIED="1599618449213" TEXT="&#x4e5f;&#x5c5e;&#x4e8e;&#x8fdb;&#x7a0b;SHR"/>
</node>
</node>
<node CREATED="1599550561858" ID="ID_195324500" MODIFIED="1599551824453" TEXT="&#x5185;&#x5b58;&#x91ca;&#x653e;">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1599547904101" HGAP="56" ID="ID_40136485" MODIFIED="1599551824453" TEXT="free()&#x91ca;&#x653e;" VSHIFT="42">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1599550578062" ID="ID_1845332807" MODIFIED="1599551824452" TEXT="&#x5185;&#x5b58;&#x6cc4;&#x6f0f;">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1599616754934" HGAP="166" ID="ID_440475173" MODIFIED="1600130921940" STYLE="bubble" TEXT="&#x672a;&#x4f53;&#x73b0;&#x5728;&#x8fdb;&#x7a0b;&#x5185;&#x5b58;&#x4e2d;&#x7684;&#x60c5;&#x51b5;" VSHIFT="-83">
<node CREATED="1599616791644" ID="ID_71894629" MODIFIED="1599616863274" TEXT="KernelStack&#xff08;&#x5185;&#x6838;&#x6808;&#xff09;"/>
<node CREATED="1599616841467" ID="ID_897523670" MODIFIED="1599616868788" TEXT="VmallocUsed&#xff08;&#x5185;&#x6838;&#x901a;&#x8fc7; vmalloc &#x7533;&#x8bf7;&#x7684;&#x5185;&#x5b58;&#xff09;"/>
<node CREATED="1599616796204" ID="ID_88578959" MODIFIED="1600131138024" TEXT="/proc/meminfo &#x4e2d;&#x7684; Slab&#xff08;&#x9ad8;&#x901f;&#x7f13;&#x5b58;&#xff09;kmallock&#x7533;&#x8bf7;&#x7684;&#x5185;&#x5b58;"/>
<node CREATED="1599616872923" HGAP="16" ID="ID_1851436030" MODIFIED="1599617932849" TEXT="tmpfs&#x5360;&#x7528;" VSHIFT="25">
<node CREATED="1599616929264" ID="ID_1718941459" MODIFIED="1599616930724" TEXT="&#x5e94;&#x7528;&#x7a0b;&#x5e8f;&#x4e3a;&#x4e86;&#x63d0;&#x5347;&#x6027;&#x80fd;&#xff0c;&#x4f1a;&#x907f;&#x514d;&#x5c06;&#x4e00;&#x4e9b;&#x65e0;&#x9700;&#x6301;&#x7eed;&#x5316;&#x5b58;&#x50a8;&#x7684;&#x6570;&#x636e;&#x5199;&#x5165;&#x5230;&#x78c1;&#x76d8;&#xff0c;&#x800c;&#x662f;&#x628a;&#x8fd9;&#x90e8;&#x5206;&#x4e34;&#x65f6;&#x6570;&#x636e;&#x5199;&#x5165;&#x5230;&#x5185;&#x5b58;&#x4e2d;&#xff0c;&#x7136;&#x540e;&#x5b9a;&#x671f;&#x6216;&#x8005;&#x5728;&#x4e0d;&#x9700;&#x8981;&#x8fd9;&#x90e8;&#x5206;&#x6570;&#x636e;&#x65f6;&#xff0c;&#x6e05;&#x7406;&#x6389;&#x8fd9;&#x90e8;&#x5206;&#x5185;&#x5bb9;&#x6765;&#x91ca;&#x653e;&#x51fa;&#x5185;&#x5b58;"/>
<node CREATED="1599616704922" ID="ID_172439913" MODIFIED="1599616718461" TEXT="&#x5185;&#x5b58;&#x5360;&#x7528;&#x91cf;&#x4e0d;&#x4f1a;&#x4f53;&#x73b0;&#x5728;&#x8fdb;&#x7a0b;&#x5185;&#x5b58;&#x4e2d;"/>
</node>
</node>
<node CREATED="1599551339672" HGAP="158" ID="ID_1485900923" MODIFIED="1600131025836" STYLE="bubble" TEXT="/proc/meminfo " VSHIFT="-80">
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node CREATED="1600130963350" HGAP="18" ID="ID_1418304089" MODIFIED="1600130975761" POSITION="right" TEXT="TCP/IP" VSHIFT="136">
<node CREATED="1600131239823" ID="ID_782830088" MODIFIED="1600137075097" STYLE="bubble" TEXT="&#x4e09;&#x6b21;&#x63e1;&#x624b;">
<node CREATED="1600133613151" ID="ID_1057560057" MODIFIED="1600137275167" TEXT="&#x56fe;&#x89e3;">
<node CREATED="1600133407801" HGAP="240" ID="ID_1470395391" MODIFIED="1600137639273" VSHIFT="-169">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img height="500" src="http://yum.2xi.com/chenke/tcpsynack_small.png" width="600" />
    </p>
  </body>
</html></richcontent>
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img height="500" width="600" src="http://yum.2xi.com/chenke/finwait.png" />
      
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1600131302223" HGAP="105" ID="ID_294108732" MODIFIED="1600136253877" TEXT="tcp_syn_retries" VSHIFT="-43">
<node CREATED="1600131738676" ID="ID_1992186072" MODIFIED="1600131768268" TEXT="client--&gt;server&#x7684;&#x7b2c;&#x4e00;&#x4e2a;&#x63e1;&#x624b;&#x5305;"/>
<node CREATED="1600131360057" ID="ID_1637831030" MODIFIED="1600131577716" TEXT="1+2+4+8+16+32+64=127&#x79d2;S&#x8d85;&#x65f6;&#xff0c;&#x4ea7;&#x751f;ETIMEOUT"/>
<node CREATED="1600131609449" ID="ID_1072301756" MODIFIED="1600131659876" TEXT="? &#x8fd9;&#x4e2a;&#x521d;&#x59cb;&#x8d85;&#x65f6;1S&#x53ef;&#x4ee5;&#x8c03;&#xff0c;&#x5982;&#x4f55;&#x64cd;&#x4f5c;&#x5462;&#xff1f;">
<font NAME="SansSerif" SIZE="19"/>
</node>
<node CREATED="1600131348508" HGAP="24" ID="ID_1677410033" MODIFIED="1600131789285" TEXT="&#x9ed8;&#x8ba4;6" VSHIFT="6"/>
<node CREATED="1600131447048" ID="ID_1769140310" MODIFIED="1600136312555" TEXT="&#x5185;&#x90e8;&#x670d;&#x52a1;&#x5668;&#x63a8;&#x8350;&#x503c;2">
<font NAME="SansSerif" SIZE="15"/>
</node>
</node>
<node CREATED="1600135811570" HGAP="60" ID="ID_1570196524" MODIFIED="1600136893361" TEXT="tcp_max_syn_backlog" VSHIFT="-18">
<node CREATED="1600135866624" ID="ID_1231706314" MODIFIED="1600135885013" TEXT="&#x5f53;&#x7cfb;&#x7edf;&#x4e2d;&#x79ef;&#x538b;&#x7684;&#x534a;&#x8fde;&#x63a5;&#x4e2a;&#x6570;&#x8d85;&#x8fc7;&#x4e86;&#x8be5;&#x503c;&#x540e;&#xff0c;&#x65b0;&#x7684; SYN &#x5305;&#x5c31;&#x4f1a;&#x88ab;&#x4e22;&#x5f03;"/>
<node CREATED="1600135893663" ID="ID_181022639" MODIFIED="1600135984993" TEXT="&#x76ee;&#x524d;&#x7ebf;&#x4e0a;&#x503c;262144"/>
</node>
<node CREATED="1600136024069" HGAP="47" ID="ID_613884537" MODIFIED="1600136896859" TEXT="tcp_syncookies" VSHIFT="-12">
<node CREATED="1600136027063" ID="ID_1557156537" MODIFIED="1600136059971" TEXT="&#x5728; Server &#x6536;&#x5230; SYN &#x5305;&#x65f6;&#xff0c;&#x4e0d;&#x53bb;&#x5206;&#x914d;&#x8d44;&#x6e90;&#x6765;&#x4fdd;&#x5b58; Client &#x7684;&#x4fe1;&#x606f;&#xff0c;&#x800c;&#x662f;&#x6839;&#x636e;&#x8fd9;&#x4e2a; SYN &#x5305;&#x8ba1;&#x7b97;&#x51fa;&#x4e00;&#x4e2a; Cookie &#x503c;&#xff0c;&#x7136;&#x540e;&#x5c06; Cookie &#x8bb0;&#x5f55;&#x5230; SYNACK &#x5305;&#x4e2d;&#x53d1;&#x9001;&#x51fa;&#x53bb;&#x3002;&#x5bf9;&#x4e8e;&#x6b63;&#x5e38;&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x8be5; Cookies &#x503c;&#x4f1a;&#x968f;&#x7740; Client &#x7684; ACK &#x62a5;&#x6587;&#x88ab;&#x5e26;&#x56de;&#x6765;&#x3002;&#x7136;&#x540e; Server &#x518d;&#x6839;&#x636e;&#x8fd9;&#x4e2a; Cookie &#x68c0;&#x67e5;&#x8fd9;&#x4e2a; ACK &#x5305;&#x7684;&#x5408;&#x6cd5;&#x6027;&#xff0c;&#x5982;&#x679c;&#x5408;&#x6cd5;&#xff0c;&#x624d;&#x53bb;&#x521b;&#x5efa;&#x65b0;&#x7684; TCP &#x8fde;&#x63a5;&#x3002;"/>
<node CREATED="1600136064574" ID="ID_41470774" MODIFIED="1600136073608" TEXT="&#x53ef;&#x4ee5;&#x9632;&#x6b62;&#x90e8;&#x5206; SYN Flood &#x653b;&#x51fb;"/>
<node CREATED="1600136074862" ID="ID_1453184245" MODIFIED="1600136307396" TEXT="&#x63a8;&#x8350;&#x5f00;&#x542f;&#xff1a;net.ipv4.tcp_syncookies = 1">
<font NAME="SansSerif" SIZE="15"/>
</node>
</node>
<node CREATED="1600136207216" ID="ID_1749169401" MODIFIED="1600136222737" TEXT="tcp_synack_retries">
<node CREATED="1600136223970" ID="ID_31122680" MODIFIED="1600136259512" TEXT="&#x91cd;&#x4f20;&#x7b56;&#x7565;&#x540c;tcp_syn_retries"/>
<node CREATED="1600136262161" ID="ID_506119236" MODIFIED="1600136269629" TEXT="&#x9ed8;&#x8ba4;&#x503c;5"/>
<node CREATED="1600136269973" ID="ID_1200591245" MODIFIED="1600136303838" TEXT="&#x5185;&#x90e8;&#x670d;&#x52a1;&#x5668;&#x63a8;&#x8350;&#x503c;:net.ipv4.tcp_synack_retries = 2">
<font NAME="SansSerif" SIZE="15"/>
</node>
</node>
<node CREATED="1600136581307" ID="ID_660514633" MODIFIED="1600136583638" TEXT="somaxconn">
<node CREATED="1600136584140" ID="ID_1041752274" MODIFIED="1600136723479" TEXT="&#x5168;&#x8fde;&#x63a5;&#x961f;&#x5217;&#x957f;&#x5ea6;"/>
<node CREATED="1600136645120" ID="ID_1351179446" MODIFIED="1600136686831" TEXT="net.core.somaxconn=65535">
<font NAME="SansSerif" SIZE="15"/>
</node>
<node CREATED="1600136688267" ID="ID_942027236" MODIFIED="1600136720077" TEXT="&#x9ed8;&#x8ba4;128,5.4&#x4ee5;&#x540e; 4096"/>
</node>
<node CREATED="1600136740616" HGAP="18" ID="ID_1276182641" MODIFIED="1600136778237" TEXT="tcp_abort_on_overflow" VSHIFT="21">
<node CREATED="1600136744995" ID="ID_1153182752" MODIFIED="1600136771901" TEXT="&#x5168;&#x8fde;&#x63a5;&#x961f;&#x5217;&#x6ee1;&#x4e86;&#x540e;&#x4e22;&#x5f03;&#x8fd8;&#x662f;reset"/>
<node CREATED="1600136793468" ID="ID_1056839718" MODIFIED="1600136810333" TEXT="&#x8be5;&#x503c;&#x9ed8;&#x8ba4;&#x4e3a; 0,&#x5373;&#x662f;&#x4e0d;&#x53d1;&#x9001;reset"/>
<node CREATED="1600136811947" HGAP="21" ID="ID_75184632" MODIFIED="1600136857034" TEXT="&#x63a8;&#x8350;&#x503c; 0" VSHIFT="15">
<font NAME="SansSerif" SIZE="15"/>
<node CREATED="1600136850226" ID="ID_848430636" MODIFIED="1600136851866" TEXT="&#x7ed9;&#x4e86; Client &#x4e00;&#x4e2a;&#x91cd;&#x8bd5;&#x7684;&#x673a;&#x4f1a;"/>
</node>
</node>
</node>
<node CREATED="1600136881283" ID="ID_562138543" MODIFIED="1600137015724" STYLE="bubble" TEXT="&#x56db;&#x6b21;&#x6325;&#x624b;">
<node CREATED="1600137024197" ID="ID_1450120930" MODIFIED="1600137034797" TEXT="&#x56fe;&#x89e3;">
<node CREATED="1600137038077" ID="ID_167639847" LINK="http://yum.52digua.com/chenke/finwait.png" MODIFIED="1600137433557" TEXT=""/>
<node CREATED="1600137545476" ID="ID_1067272666" MODIFIED="1600138399767">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img height="500" width="600" src="http://yum.2xi.com/chenke/finwait.png" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1600138497698" ID="ID_930436852" MODIFIED="1600138533642" TEXT="&#x5f53;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;&#x8c03;&#x7528; close() &#x65f6;&#xff0c;&#x4f1a;&#x5411;&#x5bf9;&#x7aef;&#x53d1;&#x9001; FIN &#x5305;&#xff0c;&#x7136;&#x540e;&#x4f1a;&#x63a5;&#x6536; ACK&#xff1b;&#x5bf9;&#x7aef;&#x4e5f;&#x4f1a;&#x8c03;&#x7528; clsoe() &#x6765;&#x53d1;&#x9001; FIN&#xff0c;&#x7136;&#x540e;&#x672c;&#x7aef;&#x4e5f;&#x4f1a;&#x5411;&#x5bf9;&#x7aef;&#x56de; ACK&#xff0c;&#x8fd9;&#x5c31;&#x662f; TCP &#x7684;&#x56db;&#x6b21;&#x6325;&#x624b;&#x8fc7;&#x7a0b;&#x3002;"/>
<node CREATED="1600152758762" ID="ID_248002561" MODIFIED="1600152803140" TEXT="CLOSE_WAIT">
<node CREATED="1600152803742" ID="ID_1055434175" MODIFIED="1600152809782" TEXT="&#x65e0;&#x7cfb;&#x7edf;&#x914d;&#x7f6e;&#x9879;"/>
<node CREATED="1600155281860" ID="ID_1755770763" MODIFIED="1600155296193" TEXT="&#x6570;&#x91cf;&#x5f88;&#x591a;&#x65f6;&#xff0c;&#x6700;&#x597d;&#x53bb;&#x6392;&#x67e5;&#x4e00;&#x4e0b;&#x4f60;&#x7684;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;&#xff0c;&#x770b;&#x770b;&#x54ea;&#x91cc;&#x6f0f;&#x6389;&#x4e86; close()"/>
</node>
<node CREATED="1600152857583" HGAP="21" ID="ID_1224790881" MODIFIED="1600155299560" TEXT="FIN_WAIT_2" VSHIFT="19">
<node CREATED="1600152859619" ID="ID_125425469" MODIFIED="1600152895678" TEXT="&#x6536;&#x4e0d;&#x5230;&#x88ab;&#x52a8;&#x7aef;&#x7684;FIN,&#x5219;&#x4e00;&#x76f4;&#x5c31;&#x5728;&#x8fd9;&#x4e2a;&#x72b6;&#x6001;"/>
<node CREATED="1600152896159" ID="ID_1621079501" MODIFIED="1600152920234" TEXT="tcp_fin_timeout &#x9ed8;&#x8ba4;&#x4e3a; 60s"/>
<node CREATED="1600152936110" ID="ID_1400081215" MODIFIED="1600152948813" TEXT="&#x6570;&#x636e;&#x4e2d;&#x5fc3;&#x5185;&#x90e8;&#x63a8;&#x8350;">
<node CREATED="1600152949288" ID="ID_1392642257" MODIFIED="1600152953163" TEXT="net.ipv4.tcp_fin_timeout = 2">
<font NAME="SansSerif" SIZE="15"/>
</node>
</node>
</node>
<node CREATED="1600153429471" HGAP="21" ID="ID_401691458" MODIFIED="1600155302147" TEXT="TIME_WAIT" VSHIFT="29">
<node CREATED="1600153444336" ID="ID_414966583" MODIFIED="1600153519620" TEXT="TCP_TIMEWAIT_LEN &#x5185;&#x6838;&#x7f16;&#x8bd1;&#x624d;&#x80fd;&#x6539;&#xff0c;&#x9ed8;&#x8ba4;60s"/>
<node CREATED="1600153550129" ID="ID_1549513859" MODIFIED="1600153567338" TEXT="tcp_max_tw_buckets &#x6700;&#x591a;time_wait&#x6570;"/>
<node CREATED="1600153583091" ID="ID_996757322" MODIFIED="1600153606159" TEXT="&#x6570;&#x636e;&#x4e2d;&#x5fc3;&#x53ef;&#x8c03;&#x5c0f;&#xff1a;net.ipv4.tcp_max_tw_buckets = 10000">
<font NAME="SansSerif" SIZE="15"/>
</node>
<node CREATED="1600154943760" ID="ID_1626306810" MODIFIED="1600155014215" TEXT="net.ipv4.tcp_tw_reuse = 1 #time_wait&#x590d;&#x7528;">
<font NAME="SansSerif" SIZE="15"/>
</node>
<node CREATED="1600154972553" ID="ID_699802609" MODIFIED="1600155016303" TEXT="net.ipv4.tcp_tw_recycle = 0 #&#x4e3a;1&#x65f6;nat&#x4e0b;&#x673a;&#x5668;&#x8fde;&#x63a5;&#x4f1a;&#x6709;&#x95ee;&#x9898;">
<font NAME="SansSerif" SIZE="15"/>
<node CREATED="1600155023590" ID="ID_1657818153" MODIFIED="1600155057433" TEXT="5.4&#x4ee5;&#x540e;&#x4e3a;0&#x4e14;&#x5df2;&#x5220;&#x9664;&#x8fd9;&#x4e2a;&#x914d;&#x7f6e;&#x9879;"/>
</node>
</node>
</node>
</node>
</node>
</map>
