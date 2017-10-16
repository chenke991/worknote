<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#000000" CREATED="1482196027994" ID="ID_1323660281" MODIFIED="1482368531593" STYLE="bubble" TEXT="deployforrsync.sh">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font color="#d8222b">&#27492;&#33050;&#26412;&#35843;&#29992;&#20854;&#23427;&#33050;&#26412;&#65292;&#35831;&#21247;&#21464;&#26356;</font>
    </p>
  </body>
</html>
</richcontent>
<font NAME="SansSerif" SIZE="20"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties"/>
<hook NAME="accessories/plugins/HierarchicalIcons.properties"/>
<node COLOR="#0033ff" CREATED="1482196039360" HGAP="-25" ID="ID_738768543" MODIFIED="1482198205852" POSITION="right" STYLE="bubble" TEXT="&#x51fd;&#x6570;" VSHIFT="-76">
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<node COLOR="#00b439" CREATED="1482196060937" ID="ID_1417478266" MODIFIED="1482198890995" STYLE="bubble" TEXT="Copy_File">
<edge COLOR="#de3131" STYLE="bezier" WIDTH="thin"/>
<arrowlink COLOR="#e32828" DESTINATION="ID_942905888" ENDARROW="Default" ENDINCLINATION="749;0;" ID="Arrow_ID_220793646" STARTARROW="None" STARTINCLINATION="724;0;"/>
<font ITALIC="true" NAME="SansSerif" SIZE="16"/>
<icon BUILTIN="full-1"/>
</node>
<node COLOR="#00b439" CREATED="1482196219116" ID="ID_1682102011" MODIFIED="1482198396234" STYLE="bubble" TEXT="Config_cp">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink COLOR="#e99409" DESTINATION="ID_544493285" ENDARROW="Default" ENDINCLINATION="615;0;" ID="Arrow_ID_260933823" STARTARROW="None" STARTINCLINATION="615;0;"/>
<icon BUILTIN="full-2"/>
</node>
<node COLOR="#00b439" CREATED="1482196225300" ID="ID_1798934628" MODIFIED="1482198905371" STYLE="bubble" TEXT="Change_DbConfig">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink COLOR="#9cc276" DESTINATION="ID_690707731" ENDARROW="Default" ENDINCLINATION="462;0;" ID="Arrow_ID_1408463200" STARTARROW="None" STARTINCLINATION="458;0;"/>
<icon BUILTIN="full-3"/>
</node>
<node COLOR="#00b439" CREATED="1482196231753" ID="ID_1521588887" MODIFIED="1482198899555" STYLE="bubble" TEXT="Create_Dabatase">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink COLOR="#26da2f" DESTINATION="ID_1615700214" ENDARROW="Default" ENDINCLINATION="355;0;" ID="Arrow_ID_90558085" STARTARROW="None" STARTINCLINATION="355;0;"/>
<icon BUILTIN="full-4"/>
</node>
<node COLOR="#00b439" CREATED="1482196237705" ID="ID_240760668" MODIFIED="1482302446705">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Start_Server
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink COLOR="#0687e6" DESTINATION="ID_1509906963" ENDARROW="Default" ENDINCLINATION="165;29;" ID="Arrow_ID_783912806" STARTARROW="None" STARTINCLINATION="322;57;"/>
<font ITALIC="true" NAME="SansSerif" SIZE="16"/>
<icon BUILTIN="full-5"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1482198538018" HGAP="-10" ID="ID_98949433" MODIFIED="1482198612018" POSITION="right" TEXT="&#x540c;&#x6b65;&#x81f3;minion" VSHIFT="-42">
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<node COLOR="#00b439" CREATED="1482198489923" HGAP="-48" ID="ID_724625479" MODIFIED="1482204007997" TEXT="other.deploy" VSHIFT="58">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font color="#2fb341">salt minion_id state.sls other.deploy</font>
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1482196448556" HGAP="-21" ID="ID_499150799" MODIFIED="1482200036973" POSITION="right" TEXT="&#x8c03;&#x7528;&#x811a;&#x672c;" VSHIFT="129">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font color="#48ec25" size="4">&#25152;&#26377;&#35843;&#29992;&#33050;&#26412;&#38656;&#35201;&#26681;&#25454;&#23454;&#38469;&#24212;&#29992;&#25163;&#21160;&#32534;&#20889;</font>
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<node COLOR="#00b439" CREATED="1482196866259" ID="ID_295034292" MODIFIED="1482198119596" TEXT="update.sh">
<edge STYLE="bezier" WIDTH="thin"/>
<node COLOR="#990000" CREATED="1482197698559" HGAP="7" ID="ID_1509906963" MODIFIED="1482302446705" TEXT="&#x9996;&#x6b21;&#x542f;&#x52a8;&#x670d;&#x52a1;" VSHIFT="-12">
<linktarget COLOR="#0687e6" DESTINATION="ID_1509906963" ENDARROW="Default" ENDINCLINATION="165;29;" ID="Arrow_ID_783912806" SOURCE="ID_240760668" STARTARROW="None" STARTINCLINATION="322;57;"/>
<font NAME="SansSerif" SIZE="14"/>
</node>
<node COLOR="#990000" CREATED="1482197194029" HGAP="9" ID="ID_10768942" MODIFIED="1482197781413" TEXT="sh update.sh first_start" VSHIFT="10">
<font NAME="SansSerif" SIZE="14"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1482196915727" HGAP="24" ID="ID_1078828969" MODIFIED="1482197906531" TEXT="create_database.sh" VSHIFT="26">
<edge STYLE="bezier" WIDTH="thin"/>
<node COLOR="#990000" CREATED="1482197662154" HGAP="5" ID="ID_1615700214" MODIFIED="1482198899555" TEXT="&#x521b;&#x5efa;&#x6570;&#x636e;&#x5e93;" VSHIFT="29">
<linktarget COLOR="#26da2f" DESTINATION="ID_1615700214" ENDARROW="Default" ENDINCLINATION="355;0;" ID="Arrow_ID_90558085" SOURCE="ID_1521588887" STARTARROW="None" STARTINCLINATION="355;0;"/>
<font NAME="SansSerif" SIZE="14"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1482197055133" HGAP="22" ID="ID_347729185" MODIFIED="1482197906530" TEXT="changeconfig.sh" VSHIFT="-5">
<edge STYLE="bezier" WIDTH="thin"/>
<node COLOR="#990000" CREATED="1482197609776" HGAP="-18" ID="ID_690707731" MODIFIED="1482198905371" TEXT="&#x5176;&#x5b83;&#x9700;&#x8981;&#x4fee;&#x6539;&#x914d;&#x7f6e;&#x7684;&#x64cd;&#x4f5c;" VSHIFT="40">
<linktarget COLOR="#9cc276" DESTINATION="ID_690707731" ENDARROW="Default" ENDINCLINATION="462;0;" ID="Arrow_ID_1408463200" SOURCE="ID_1798934628" STARTARROW="None" STARTINCLINATION="458;0;"/>
<font NAME="SansSerif" SIZE="14"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1482196777379" HGAP="23" ID="ID_1178751143" MODIFIED="1482197958490" TEXT="cp_config.sh" VSHIFT="-2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1482197548404" HGAP="7" ID="ID_544493285" MODIFIED="1482198386554" TEXT="&#x5c06;&#x8fd0;&#x7ef4;&#x5e73;&#x53f0;&#x751f;&#x6210;&#x7684;&#x914d;&#x7f6e;&#x6587;&#x590d;&#x5236;&#x5230;&#x76f8;&#x5e94;&#x76ee;&#x5f55;" VSHIFT="32">
<linktarget COLOR="#e99409" DESTINATION="ID_544493285" ENDARROW="Default" ENDINCLINATION="615;0;" ID="Arrow_ID_260933823" SOURCE="ID_1682102011" STARTARROW="None" STARTINCLINATION="615;0;"/>
<font NAME="SansSerif" SIZE="14"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1482196464046" HGAP="11" ID="ID_998889080" MODIFIED="1482197951682" TEXT="rsync_and_decom.sh">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1482196539393" HGAP="-9" ID="ID_942905888" MODIFIED="1482198890995" TEXT="&#x4ece;&#x672c;&#x673a;&#x623f;&#x5185;rsyncserver&#x540c;&#x6b65;&#x81f3;&#x672c;&#x5730;/data/file/gamename/role" VSHIFT="38">
<linktarget COLOR="#e32828" DESTINATION="ID_942905888" ENDARROW="Default" ENDINCLINATION="749;0;" ID="Arrow_ID_220793646" SOURCE="ID_1417478266" STARTARROW="None" STARTINCLINATION="724;0;"/>
<font NAME="SansSerif" SIZE="14"/>
</node>
</node>
</node>
</node>
</map>
