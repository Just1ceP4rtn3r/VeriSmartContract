#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(4*sizeof(Trans **));

	/* proctype 2: :init: */

	trans[2] = (Trans **) emalloc(5*sizeof(Trans *));

	T = trans[ 2][2] = settr(187,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(187,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[2][1]	= settr(186,0,3,3,3,"(run Contract(channel,0))", 1, 2, 0);
	trans[2][3]	= settr(188,0,4,4,4,"(run User(channel,1))", 1, 2, 0);
	trans[2][4]	= settr(189,0,0,5,5,"-end-", 0, 3500, 0);

	/* proctype 1: Contract */

	trans[1] = (Trans **) emalloc(130*sizeof(Trans *));

	trans[1][1]	= settr(57,0,8,6,6,"i = 0", 0, 2, 0);
	trans[1][9]	= settr(65,0,8,1,0,".(goto)", 0, 2, 0);
	T = trans[1][8] = settr(64,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(64,0,2,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(64,0,6,0,0,"DO", 0, 2, 0);
	trans[1][2]	= settr(58,0,3,7,0,"((i<2))", 0, 2, 0);
	trans[1][3]	= settr(59,0,4,8,8,"balanceX[i] = 0", 1, 2, 0);
	trans[1][4]	= settr(60,0,5,9,9,"balanceY[i] = 0", 1, 2, 0);
	trans[1][5]	= settr(61,0,8,10,10,"i = (i+1)", 0, 2, 0);
	trans[1][6]	= settr(62,0,11,2,0,"else", 0, 2, 0);
	trans[1][7]	= settr(63,0,11,1,0,"goto :b1", 0, 2, 0); /* m: 11 -> 0,27 */
	reached1[11] = 1;
	trans[1][10]	= settr(66,0,11,1,0,"break", 0, 2, 0);
	trans[1][11]	= settr(67,0,27,11,11,"i = 0", 0, 2, 0); /* m: 12 -> 0,27 */
	reached1[12] = 1;
	trans[1][12]	= settr(0,0,0,0,0,"j = 0",0,0,0);
	trans[1][28]	= settr(84,0,27,1,0,".(goto)", 0, 2, 0);
	T = trans[1][27] = settr(83,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(83,0,13,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(83,0,25,0,0,"DO", 0, 2, 0);
	trans[1][13]	= settr(69,0,21,12,12,"((i<2))", 0, 2, 0); /* m: 14 -> 21,0 */
	reached1[14] = 1;
	trans[1][14]	= settr(0,0,0,0,0,"j = 0",0,0,0);
	trans[1][22]	= settr(78,0,21,1,0,".(goto)", 0, 2, 0);
	T = trans[1][21] = settr(77,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(77,0,15,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(77,0,19,0,0,"DO", 0, 2, 0);
	trans[1][15]	= settr(71,0,16,13,0,"((j<2))", 0, 2, 0);
	trans[1][16]	= settr(72,0,17,14,14,"allowanceX[i].Spender[j] = 0", 1, 2, 0);
	trans[1][17]	= settr(73,0,18,15,15,"allowanceY[i].Spender[j] = 0", 1, 2, 0);
	trans[1][18]	= settr(74,0,21,16,16,"j = (j+1)", 0, 2, 0);
	trans[1][19]	= settr(75,0,24,2,0,"else", 0, 2, 0);
	trans[1][20]	= settr(76,0,24,1,0,"goto :b3", 0, 2, 0); /* m: 24 -> 0,27 */
	reached1[24] = 1;
	trans[1][23]	= settr(79,0,24,1,0,"break", 0, 2, 0);
	trans[1][24]	= settr(80,0,27,17,17,"i = (i+1)", 0, 2, 0);
	trans[1][25]	= settr(81,0,30,2,0,"else", 0, 2, 0);
	trans[1][26]	= settr(82,0,30,1,0,"goto :b2", 0, 2, 0);
	trans[1][29]	= settr(85,0,30,1,0,"break", 0, 2, 0);
	trans[1][30]	= settr(86,0,31,18,18,"balanceY[addr] = 1", 1, 2, 0);
	trans[1][31]	= settr(87,0,126,19,19,"msg_method = -(1)", 0, 2, 0); /* m: 32 -> 0,126 */
	reached1[32] = 1;
	trans[1][32]	= settr(0,0,0,0,0,"msg_sender = -(1)",0,0,0);
	trans[1][33]	= settr(0,0,0,0,0,"msg_receiver = -(1)",0,0,0);
	trans[1][34]	= settr(0,0,0,0,0,"msg_spender = -(1)",0,0,0);
	trans[1][127]	= settr(183,0,126,1,0,".(goto)", 0, 2, 0);
	T = trans[1][126] = settr(182,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(182,0,125,0,0,"DO", 0, 2, 0);
	T = trans[ 1][125] = settr(181,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(181,2,35,0,0,"ATOMIC", 1, 504, 0);
	trans[1][35]	= settr(91,2,123,20,20,"channel?msg_method,msg_sender,msg_receiver,msg_spender", 1, 504, 0);
	T = trans[1][123] = settr(179,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,36,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,41,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,53,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,63,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,74,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(179,2,85,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(179,2,121,0,0,"IF", 1, 504, 0);
	trans[1][36]	= settr(92,2,39,21,21,"((msg_method==0))", 1, 504, 0);
	T = trans[ 1][39] = settr(95,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(95,0,37,0,0,"sub-sequence", 1, 504, 0);
	trans[1][37]	= settr(93,0,126,22,22,"balanceX[msg_sender] = 1", 1, 504, 0); /* m: 38 -> 0,126 */
	reached1[38] = 1;
	trans[1][38]	= settr(0,0,0,0,0,"balanceY[msg_sender] = 1",0,0,0);
	trans[1][40]	= settr(0,0,0,0,0,"printf('[DBG]: User %d initialization\\n',msg_sender)",0,0,0);
	trans[1][124]	= settr(180,0,126,23,23,".(goto)", 1, 504, 0);
	trans[1][41]	= settr(97,2,52,24,24,"((msg_method==1))", 1, 504, 0); /* m: 42 -> 52,0 */
	reached1[42] = 1;
	trans[1][42]	= settr(0,0,0,0,0,"printf('[DBG]: call approveX(msg_sender:%d, msg_spender:%d, 1)\\n',msg_sender,msg_sender,msg_spender)",0,0,0);
	T = trans[ 1][52] = settr(108,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(108,0,50,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][50] = settr(106,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(106,2,43,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(106,2,48,0,0,"IF", 1, 504, 0);
	trans[1][43]	= settr(99,0,126,25,25,"(((allowanceX[msg_sender].Spender[msg_spender]+1)<=balanceX[msg_sender]))", 1, 504, 0); /* m: 44 -> 126,0 */
	reached1[44] = 1;
	trans[1][44]	= settr(0,0,0,0,0,"allowanceX[msg_sender].Spender[msg_spender] = (allowanceX[msg_sender].Spender[msg_spender]+1)",0,0,0);
	trans[1][45]	= settr(0,0,0,0,0,"balanceX[msg_sender] = (balanceX[msg_sender]-1)",0,0,0);
	trans[1][46]	= settr(0,0,0,0,0,"balanceX[msg_spender] = (balanceX[msg_spender]+1)",0,0,0);
	trans[1][47]	= settr(0,0,0,0,0,"printf('[DBG]: approveX(msg_sender:%d, msg_spender:%d, 1)\\n',msg_sender,msg_sender,msg_spender)",0,0,0);
	trans[1][51]	= settr(107,0,126,26,26,".(goto)", 1, 504, 0); /* m: 124 -> 0,126 */
	reached1[124] = 1;
	trans[1][48]	= settr(104,2,49,2,0,"else", 1, 504, 0);
	trans[1][49]	= settr(105,0,126,27,27,"(1)", 1, 504, 0); /* m: 51 -> 126,0 */
	reached1[51] = 1;
	trans[1][53]	= settr(109,2,62,28,28,"((msg_method==2))", 1, 504, 0); /* m: 54 -> 62,0 */
	reached1[54] = 1;
	trans[1][54]	= settr(0,0,0,0,0,"printf('[DBG]: call transferFromX(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	T = trans[ 1][62] = settr(118,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(118,0,60,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][60] = settr(116,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(116,2,55,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(116,2,58,0,0,"IF", 1, 504, 0);
	trans[1][55]	= settr(111,0,126,29,29,"((allowanceX[msg_sender].Spender[0]>=1))", 1, 504, 0); /* m: 56 -> 126,0 */
	reached1[56] = 1;
	trans[1][56]	= settr(0,0,0,0,0,"allowanceX[msg_sender].Spender[0] = (allowanceX[msg_sender].Spender[0]-1)",0,0,0);
	trans[1][57]	= settr(0,0,0,0,0,"printf('[DBG]: transferFromX(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	trans[1][61]	= settr(117,0,126,30,30,".(goto)", 1, 504, 0); /* m: 124 -> 0,126 */
	reached1[124] = 1;
	trans[1][58]	= settr(114,2,59,2,0,"else", 1, 504, 0);
	trans[1][59]	= settr(115,0,126,31,31,"(1)", 1, 504, 0); /* m: 61 -> 126,0 */
	reached1[61] = 1;
	trans[1][63]	= settr(119,2,73,32,32,"((msg_method==3))", 1, 504, 0); /* m: 64 -> 73,0 */
	reached1[64] = 1;
	trans[1][64]	= settr(0,0,0,0,0,"printf('[DBG]: call transferX(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	T = trans[ 1][73] = settr(129,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(129,0,71,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][71] = settr(127,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(127,2,65,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(127,2,69,0,0,"IF", 1, 504, 0);
	trans[1][65]	= settr(121,0,126,33,33,"((balanceX[msg_sender]>=1))", 1, 504, 0); /* m: 66 -> 126,0 */
	reached1[66] = 1;
	trans[1][66]	= settr(0,0,0,0,0,"balanceX[msg_sender] = (balanceX[msg_sender]-1)",0,0,0);
	trans[1][67]	= settr(0,0,0,0,0,"balanceX[msg_receiver] = (balanceX[msg_receiver]+1)",0,0,0);
	trans[1][68]	= settr(0,0,0,0,0,"printf('[DBG]: transferX(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	trans[1][72]	= settr(128,0,126,34,34,".(goto)", 1, 504, 0); /* m: 124 -> 0,126 */
	reached1[124] = 1;
	trans[1][69]	= settr(125,2,70,2,0,"else", 1, 504, 0);
	trans[1][70]	= settr(126,0,126,35,35,"(1)", 1, 504, 0); /* m: 72 -> 126,0 */
	reached1[72] = 1;
	trans[1][74]	= settr(130,2,84,36,36,"((msg_method==4))", 1, 504, 0); /* m: 75 -> 84,0 */
	reached1[75] = 1;
	trans[1][75]	= settr(0,0,0,0,0,"printf('[DBG]: call transferY(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	T = trans[ 1][84] = settr(140,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(140,0,82,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][82] = settr(138,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(138,2,76,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(138,2,80,0,0,"IF", 1, 504, 0);
	trans[1][76]	= settr(132,0,126,37,37,"((balanceY[msg_sender]>=1))", 1, 504, 0); /* m: 77 -> 126,0 */
	reached1[77] = 1;
	trans[1][77]	= settr(0,0,0,0,0,"balanceY[msg_sender] = (balanceY[msg_sender]-1)",0,0,0);
	trans[1][78]	= settr(0,0,0,0,0,"balanceY[msg_receiver] = (balanceY[msg_receiver]+1)",0,0,0);
	trans[1][79]	= settr(0,0,0,0,0,"printf('[DBG]: transferY(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,msg_receiver)",0,0,0);
	trans[1][83]	= settr(139,0,126,38,38,".(goto)", 1, 504, 0); /* m: 124 -> 0,126 */
	reached1[124] = 1;
	trans[1][80]	= settr(136,2,81,2,0,"else", 1, 504, 0);
	trans[1][81]	= settr(137,0,126,39,39,"(1)", 1, 504, 0); /* m: 83 -> 126,0 */
	reached1[83] = 1;
	trans[1][85]	= settr(141,2,120,40,40,"((msg_method==5))", 1, 504, 0); /* m: 86 -> 120,0 */
	reached1[86] = 1;
	trans[1][86]	= settr(0,0,0,0,0,"printf('[DBG]: call swapXY(msg_sender:%d, 1, 0, 0, 1, msg_receiver:%d)\\n',msg_sender,msg_receiver)",0,0,0);
	T = trans[ 1][120] = settr(176,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(176,0,118,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][118] = settr(174,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(174,2,87,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(174,2,116,0,0,"IF", 1, 504, 0);
	trans[1][87]	= settr(143,2,114,41,0,"((((0>0)&&(0<=balanceX[0]))||((1>0)&&(1<=balanceY[0]))))", 1, 504, 0);
	T = trans[1][114] = settr(170,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(170,2,88,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(170,2,112,0,0,"IF", 1, 504, 0);
	trans[1][88]	= settr(144,2,96,42,0,"((allowanceX[msg_sender].Spender[0]>=1))", 1, 504, 0);
	T = trans[ 1][96] = settr(152,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(152,0,94,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][94] = settr(150,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(150,2,89,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(150,2,92,0,0,"IF", 1, 504, 0);
	trans[1][89]	= settr(145,2,110,43,43,"((allowanceX[msg_sender].Spender[0]>=1))", 1, 504, 0); /* m: 90 -> 110,0 */
	reached1[90] = 1;
	trans[1][90]	= settr(0,0,0,0,0,"allowanceX[msg_sender].Spender[0] = (allowanceX[msg_sender].Spender[0]-1)",0,0,0);
	trans[1][91]	= settr(0,0,0,0,0,"printf('[DBG]: transferFromX(msg_sender:%d, msg_receiver:%d, 1)\\n',msg_sender,0)",0,0,0);
	trans[1][95]	= settr(151,2,110,1,0,".(goto)", 1, 504, 0);
	trans[1][92]	= settr(148,2,93,2,0,"else", 1, 504, 0);
	trans[1][93]	= settr(149,2,110,1,0,"(1)", 1, 504, 0);
	T = trans[1][110] = settr(166,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(166,2,97,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(166,2,108,0,0,"IF", 1, 504, 0);
	trans[1][97]	= settr(153,2,106,44,0,"((1>0))", 1, 504, 0);
	T = trans[ 1][106] = settr(162,0,0,0,0,"sub-sequence", 1, 504, 0);
	T->nxt	= settr(162,0,104,0,0,"sub-sequence", 1, 504, 0);
	T = trans[1][104] = settr(160,2,0,0,0,"IF", 1, 504, 0);
	T = T->nxt	= settr(160,2,98,0,0,"IF", 1, 504, 0);
	    T->nxt	= settr(160,2,102,0,0,"IF", 1, 504, 0);
	trans[1][98]	= settr(154,0,126,45,45,"((balanceY[0]>=1))", 1, 504, 0); /* m: 99 -> 126,0 */
	reached1[99] = 1;
	trans[1][99]	= settr(0,0,0,0,0,"balanceY[0] = (balanceY[0]-1)",0,0,0);
	trans[1][100]	= settr(0,0,0,0,0,"balanceY[msg_receiver] = (balanceY[msg_receiver]+1)",0,0,0);
	trans[1][101]	= settr(0,0,0,0,0,"printf('[DBG]: transferY(msg_sender:%d, msg_receiver:%d, 1)\\n',0,msg_receiver)",0,0,0);
	trans[1][105]	= settr(161,2,107,1,0,".(goto)", 1, 504, 0); /* m: 107 -> 0,126 */
	reached1[107] = 1;
	trans[1][102]	= settr(158,2,103,2,0,"else", 1, 504, 0);
	trans[1][103]	= settr(159,0,126,46,46,"(1)", 1, 504, 0); /* m: 107 -> 126,0 */
	reached1[107] = 1;
	trans[1][107]	= settr(163,0,126,47,47,"printf('[DBG]: swapXY(msg_sender:%d, 1, 0, 0, 1, msg_receiver:%d)\\n',msg_sender,msg_receiver)", 1, 504, 0); /* m: 119 -> 0,126 */
	reached1[119] = 1;
	trans[1][111]	= settr(167,2,119,1,0,".(goto)", 1, 504, 0); /* m: 119 -> 0,126 */
	reached1[119] = 1;
	trans[1][108]	= settr(164,2,109,2,0,"else", 1, 504, 0);
	trans[1][109]	= settr(165,0,126,48,48,"(1)", 1, 504, 0); /* m: 119 -> 126,0 */
	reached1[119] = 1;
	trans[1][115]	= settr(171,2,119,1,0,".(goto)", 1, 504, 0); /* m: 119 -> 0,126 */
	reached1[119] = 1;
	trans[1][112]	= settr(168,2,113,2,0,"else", 1, 504, 0);
	trans[1][113]	= settr(169,0,126,49,49,"(1)", 1, 504, 0); /* m: 119 -> 126,0 */
	reached1[119] = 1;
	trans[1][119]	= settr(175,0,126,50,50,".(goto)", 1, 504, 0); /* m: 124 -> 0,126 */
	reached1[124] = 1;
	trans[1][116]	= settr(172,2,117,2,0,"else", 1, 504, 0);
	trans[1][117]	= settr(173,0,126,51,51,"(1)", 1, 504, 0); /* m: 119 -> 126,0 */
	reached1[119] = 1;
	trans[1][121]	= settr(177,2,122,2,0,"else", 1, 504, 0);
	trans[1][122]	= settr(178,0,126,52,52,"(1)", 1, 504, 0); /* m: 124 -> 126,0 */
	reached1[124] = 1;
	trans[1][128]	= settr(184,0,129,1,0,"break", 0, 2, 0);
	trans[1][129]	= settr(185,0,0,53,53,"-end-", 0, 3500, 0);

	/* proctype 0: User */

	trans[0] = (Trans **) emalloc(58*sizeof(Trans *));

	trans[0][1]	= settr(0,0,54,54,54,"channel!msg_method,msg_sender,msg_receiver,msg_spender", 1, 3, 0);
	trans[0][55]	= settr(54,0,54,1,0,".(goto)", 0, 2, 0);
	T = trans[0][54] = settr(53,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(53,0,53,0,0,"DO", 0, 2, 0);
	T = trans[ 0][53] = settr(52,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(52,2,6,0,0,"ATOMIC", 1, 2, 0);
	T = trans[0][6] = settr(5,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(5,2,2,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(5,2,4,0,0,"IF", 1, 2, 0);
	trans[0][2]	= settr(1,2,45,55,55,"(((balanceX[1]+balanceY[1])<2))", 1, 2, 0); /* m: 3 -> 45,0 */
	reached0[3] = 1;
	trans[0][3]	= settr(0,0,0,0,0,"deposited_flag = 1",0,0,0);
	trans[0][7]	= settr(6,2,45,1,0,".(goto)", 1, 2, 0);
	trans[0][4]	= settr(3,2,5,2,0,"else", 1, 2, 0);
	trans[0][5]	= settr(4,2,45,1,0,"(1)", 1, 2, 0);
	T = trans[0][45] = settr(44,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(44,2,8,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(44,2,21,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(44,2,34,0,0,"IF", 1, 2, 0);
	trans[0][8]	= settr(7,2,20,56,0,"(((deposited_flag==0)||(count_1<3)))", 1, 2, 0);
	T = trans[ 0][20] = settr(19,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(19,0,9,0,0,"sub-sequence", 1, 2, 0);
	trans[0][9]	= settr(8,2,13,57,57,"msg_method = 1", 1, 2, 0); /* m: 10 -> 0,13 */
	reached0[10] = 1;
	trans[0][10]	= settr(0,0,0,0,0,"msg_sender = addr",0,0,0);
	trans[0][11]	= settr(0,0,0,0,0,"msg_receiver = -(1)",0,0,0);
	trans[0][12]	= settr(0,0,0,0,0,"msg_spender = 0",0,0,0);
	trans[0][13]	= settr(12,2,18,58,58,"channel!msg_method,msg_sender,msg_receiver,msg_spender", 1, 3, 0);
	T = trans[0][18] = settr(17,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(17,2,14,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(17,2,16,0,0,"IF", 1, 2, 0);
	trans[0][14]	= settr(13,2,51,59,59,"((deposited_flag==1))", 1, 2, 0); /* m: 15 -> 51,0 */
	reached0[15] = 1;
	trans[0][15]	= settr(0,0,0,0,0,"count_1 = (count_1+1)",0,0,0);
	trans[0][19]	= settr(18,2,51,1,0,".(goto)", 1, 2, 0);
	trans[0][16]	= settr(15,2,17,2,0,"else", 1, 2, 0);
	trans[0][17]	= settr(16,2,51,1,0,"(1)", 1, 2, 0);
	trans[0][46]	= settr(45,2,51,1,0,".(goto)", 1, 2, 0);
	trans[0][21]	= settr(20,2,33,60,0,"(((deposited_flag==0)||(count_2<3)))", 1, 2, 0);
	T = trans[ 0][33] = settr(32,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(32,0,22,0,0,"sub-sequence", 1, 2, 0);
	trans[0][22]	= settr(21,2,26,61,61,"msg_method = 3", 1, 2, 0); /* m: 23 -> 0,26 */
	reached0[23] = 1;
	trans[0][23]	= settr(0,0,0,0,0,"msg_sender = addr",0,0,0);
	trans[0][24]	= settr(0,0,0,0,0,"msg_receiver = 0",0,0,0);
	trans[0][25]	= settr(0,0,0,0,0,"msg_spender = -(1)",0,0,0);
	trans[0][26]	= settr(25,2,31,62,62,"channel!msg_method,msg_sender,msg_receiver,msg_spender", 1, 3, 0);
	T = trans[0][31] = settr(30,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(30,2,27,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(30,2,29,0,0,"IF", 1, 2, 0);
	trans[0][27]	= settr(26,2,51,63,63,"((deposited_flag==1))", 1, 2, 0); /* m: 28 -> 51,0 */
	reached0[28] = 1;
	trans[0][28]	= settr(0,0,0,0,0,"count_2 = (count_2+1)",0,0,0);
	trans[0][32]	= settr(31,2,51,1,0,".(goto)", 1, 2, 0);
	trans[0][29]	= settr(28,2,30,2,0,"else", 1, 2, 0);
	trans[0][30]	= settr(29,2,51,1,0,"(1)", 1, 2, 0);
	trans[0][34]	= settr(33,2,44,64,0,"(((deposited_flag==0)||(count_4<3)))", 1, 2, 0);
	T = trans[ 0][44] = settr(43,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(43,0,35,0,0,"sub-sequence", 1, 2, 0);
	trans[0][35]	= settr(34,2,39,65,65,"msg_method = 5", 1, 2, 0); /* m: 36 -> 0,39 */
	reached0[36] = 1;
	trans[0][36]	= settr(0,0,0,0,0,"msg_sender = addr",0,0,0);
	trans[0][37]	= settr(0,0,0,0,0,"msg_receiver = addr",0,0,0);
	trans[0][38]	= settr(0,0,0,0,0,"msg_spender = -(1)",0,0,0);
	trans[0][39]	= settr(38,2,42,66,66,"channel!msg_method,msg_sender,msg_receiver,msg_spender", 1, 3, 0);
	T = trans[0][42] = settr(41,2,0,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(41,2,40,0,0,"IF", 1, 2, 0);
	trans[0][40]	= settr(39,2,51,67,67,"((deposited_flag==1))", 1, 2, 0); /* m: 41 -> 51,0 */
	reached0[41] = 1;
	trans[0][41]	= settr(0,0,0,0,0,"count_4 = (count_4+1)",0,0,0);
	trans[0][43]	= settr(42,2,51,1,0,".(goto)", 1, 2, 0);
	T = trans[0][51] = settr(50,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(50,2,47,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(50,2,49,0,0,"IF", 1, 2, 0);
	trans[0][47]	= settr(46,0,54,68,68,"((((count_1==3)&&(count_2==3))&&(count_4==3)))", 1, 2, 0); /* m: 48 -> 54,0 */
	reached0[48] = 1;
	trans[0][48]	= settr(0,0,0,0,0,"assert(((balanceX[1]+balanceY[1])==2))",0,0,0);
	trans[0][52]	= settr(51,0,54,69,69,".(goto)", 1, 2, 0);
	trans[0][49]	= settr(48,2,50,2,0,"else", 1, 2, 0);
	trans[0][50]	= settr(49,0,54,70,70,"(1)", 1, 2, 0); /* m: 52 -> 54,0 */
	reached0[52] = 1;
	trans[0][56]	= settr(55,0,57,1,0,"break", 0, 2, 0);
	trans[0][57]	= settr(56,0,0,71,71,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(3*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
