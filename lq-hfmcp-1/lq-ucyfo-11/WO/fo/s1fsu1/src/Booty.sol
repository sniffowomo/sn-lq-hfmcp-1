// Booty.sol gfx

// SPDX-License-Identifier: SmellPanty
pragma solidity ^0.8.19;

// ╔══════════════════════════════════════════════════════════════════════════════╗
// ║,,,'.'....     ..        ...:cccc...'';l0Od...  ............  ...;,':KK0000000║
// ║:,,....',..'.            ....:clc...',coxl;................   ':.':;c000000000║
// ║:;,.. .:',,l'::'.            .;l: ..':lo,......lx.,'........ .ckocloco00000000║
// ║l;,. .::;:l:xOxo;..       ....... .':llo.,,..;kK0';cc,.....';lxkkxxdlclO000O00║
// ║o:,..;ddodlxOdX0c'..    ........  .,ooool:l.c0000,:lol,...';xkOOkxxdl:;lO0000O║
// ║dc,.;odxoodkOd00o:.'   .''';:'... 'ldddxkdkc0000O;:::c;...,colcc:,..'coxlllk00║
// ║xl,,ddxxddoxxodxo:,'.  .,l:l:;'';.,oxxdk00000000x';ldkko;,.  ......okxxxxxoOOO║
// ║kd'odddddooddclol;,'.  .;lolll'.:;cxxxxk0000000Oo:ldxkO0kodl;.....xOkxdddxxOOO║
// ║O0,dooooooloocccc;,.. ..:lcclc,';cxkkxxOO000O0l.;lodxxkO0Okkxl...lkkxxddxkkO0O║
// ║kk:llllllllcc:c;:;'.. .':c:;::,,,;okkkkOOOOOOO.,;odddxkkkOOkkx; ;xkkkkxxOOkOlk║
// ║xl:lccccccc::;;;,,'.  .'::,;;;,,,;:cooodOO000:;':ooodxxkkxxxxdl.;ddxxxxkOOOOkx║
// ║x;:c::::::;,,,,,,,,' ..';;,,;,,'',;dxxxxOkOOO,c,clldddxkkxxddoc.,cldxxxxkkkkkx║
// ║x:l:::;;;;;,,'',,',. .',,,''''''',;dxxxkxxxxxo';clodoxxxxxxddlc',cloddddxxxkkx║
// ║OOkc:::;;,,,'',,,,,. .,,,','',''',,dkkxkooodddlcclolodddddxxdol''clodddodxxxxx║
// ║000l:::;,,,,''',,;:..',,,,,''''''',dkkkOxkOO000cclolldxdoddddol',ccloooooddddo║
// ║00Ko:::;;,,,'',,,;ol:,;,','''''''',xOOkO000KXKKcccooloddoldoolc..;ccclllodolcc║
// ║KKKdc::;;;,;,;::,'OKd..''''''''''',k0OO00OOO000::clllolllllcc:;...',,;;::lc:;,║
// ║KKKkl:::;;;;;;,...dKc ...'','',,'':00000000OO0O:::clollcc:c:;,,......'''';;,,,║
// ║KKKKd:;;;,,''.....,K'........'''',d0K00K00KK000;;:cccc:;,,,,'':ll ......'''','║
// ║NXXXKd;;;,''.......K..........'',;0KKKKKO00K000;:cc::;,''''..x00l  ...........║
// ║KKXXXK:,,,,'...... 0..........'',lKKKKKKOOO000O;:cc:;,'','.. kKK;  ...........║
// ║KKKKKKk,,,,''..... 0..........'',OKKKKKKO00000K;,;;;,'..''...xKK'  ...........║
// ║XKKKK00d,,,,''.....0..''......''cKKK0KKK00KKKKK;'',,'....... xKK;  ..........:║
// ║XXXKKKK0o,,,,,'... x..''.......'k000000K0KKKKKKc.,'''....... OKKl  ..........k║
// ║NNNXXKKKKl,,,,'... :..''.......cK000000K0000000l............ 0KKd   .........0║
// ║NNNNXXXKK0:,,,'...  ..''......'OK000000K0000000x............c000O   ........;0║
// ║xxxkxxxxdd:''...... ........'.,xKKKKKKKK00Oooodl''..........:oool...'..cddddkK║
// ║l.. ..........   ...    .......xKKKKKKKKKKKl.. ........   ...   ......:0KKKKKK║
// ║Xo.  ..,'.....   .  .   .....;KKKKKKKKKKKKKXd:...''.....  .  . ......oKKKKKK00║
// ║X0l' ..........  .   ........OKKKK000000KKKkl. .......... .  .......'KK0K00000║
// ║,.   ........... .  .....,...KKK000000000Oo...  ............  ...;,';KK0000000║
// ║,...  ............. .....:,,'K0000000000xo:................   .;.';;:000000000║
// ║......,...........   .l,',c::O0000000000,......:x.''........ .:xlcllcx00000000║
// ║....'kd',,......... .,kxocooclO00000000O ''..,xK0';c:'.....',:dkxxdolcoO000000║
// ║...d0Kk,;cc,.......:cdkkxxddoccO000000OOlcl.c0K00,:lol,...',xkOOkxxdoc:oO0000O║
// ║,;O000k,:coo;.....'dkOOkxxdooc::k000OO0Okdk:0000O;:ccc;...;ldoooc:,..loolodkOO║
// ║;O0000x;:cllc'..':oxdddoc::,.,cllloxO00000000000k,:coxxo;,.       .okxxxxdlOOO║
// ║000000d',:coxl,....'.'.'.'':dxxxkkolOOO00O0O000OocldxkO0xodc;    .xOkxdodxdO0O║
// ║0O0000;:loxkkOkclc:.''..''dOkkxdddkdOOO0OO00O0o',codxxkO0Okkxl   okkkxddxkOOOO║
// ║0OO0xl;lodxxkO0Oxdxd;'..'dOOkxdodoxkO0O0OOOOOO.,;oddxxkkkOOkkx: 'xkxkxxxkOOOoO║
// ║0O0l;.:oddxxxkO000Okd,..:xkkxxxdkkOOOOO0O0OO0l;,:ooodxxkkxxxxdd.;dxxkxxkOOOOkd║
// ║0O0;.:codddxkkkkkkkkxl'.lxkxkkxxkOOkOoxOOOOOO;l,clldddxkkxxddol',lldxxxxkkkkkx║
// ║O0lo;,cloodxxxkkxxxxdo;.lddxkkxxOOOkOkkOxxxxxl',clodddkxxxxddoc',clodxddxkkkkx║
// ║OOccc:clldxdxkkkxxddlc;.:cldxxxxkkkkkkxxooodddlccloooxxddxxxdol''clodddodxxxxx║
// ║xxd:.:clooddxxxxxxddoc;.;ccodddddxxkkkxkxkkOOOOcclolldxdodddddl''ccloooooddddo║
// ║oddlccclooodddddxdxdol:.;cloodddodxxxxxK000KKXK:ccooldddolodolc'';cclllloddolc║
// ║kOOOxccoolldxddodddddo:.:cclooooodxdddd000O0000::clooloolllllc;..'',,;::clc:;,║
// ║KKKKk:clollodddlddddol:.;:clllloldddollk000OOOO::cccollcccc:;,,......''',;;,,,║
// ║0KKKx::lloooooollolll:;..,;;::ccclolcc;x00KK000;::cccc::;,;,'';:c.......','',,║
// ║OO00x::cccollllllcc:;;, ....'',,;:c:;;,oO0KK000;:cc::;,'''''.d00o  ........''.║
// ║0000x;::clllcl::::;,',. ..'..'''',,,,,,lOO0000O;:cc:;,',,''. kKK;  ...........║
// ║KK00x;:ccc:::;,,,,'''lok:.......'''.,,'lOO00000;,;;;,'..''...xKK'  ...........║
// ║0000x;ccc::;,'''''..x000.  ..........'.d0K00KKK;',,,'........xKK;  ..........;║
// ║0000x;:cl:;,.',,'...xKKO   ............x0KKKKKK:','''....... kKKl  ..........x║
// ║0000k',;;;,'...'....xKKk   ............00000K0Kl............ 0KKd  ..........0║
// ║0K0KO.,,,,'.........xKKO   ...........;K0000000d............:K00k   ........,0║
// ╚══════════════════════════════════════════════════════════════════════════════╝

contract Booty {
    function booty() public pure {}
}
