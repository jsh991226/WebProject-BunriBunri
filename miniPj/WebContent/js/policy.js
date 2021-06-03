
var cityColor = {
	Seoul: 'ffeefa',
	Busan: '78D4FF',
	Daegu: 'B8C2FF',
	Incheon: 'ffbcec',
	Gwangju: 'B4E0C5',
	Daejeon: 'E5D3E6',
	Ulsan: 'C4ECFF',
	Sejong: 'C4BEE8',
	Gyeonggi: 'fdd2ff',
	Gangwon: 'babbff',
	Chungcheongbugdo: 'EBDEFF',
	Chungcheongnamdo: 'FEEBFF',
	Jeollabugdo: 'DDF9FA',
	Jeonlanamdo: 'C8FADC',
	Gyeongsangbugdo: 'D1D8FF',
	Gyeongsangnamdo: 'CFE2FA',
	Jeju: 'FAD1B6'
};
function newView(goto) {
	window.open('about:blank').location.href = goto;
}


$(document).ready(function() {
	$('text').hover(function() {
		var hoverCity = $(this).attr('id').substring(1);
		$('#' + hoverCity).css('fill', '#' + cityColor[hoverCity]);
	}, function() {
		var hoverCity = $(this).attr('id').substring(1);
		$('#' + hoverCity).css('fill', '');

	});
})

$(document).ready(function() {
	$('.Seoul > .gangnamgu').click(function() {
		newView("https://www.gangnam.go.kr/board/waste/list.do?mid=FM011109");
	})

	$('.Seoul > .gangdonggu').click(function() {
		newView("https://www.gangdong.go.kr/site/contents/koRenew/html07/html09/index01.html");
	})

	$('.Seoul > .gangbukgu').click(function() {
		newView("https://www.gangbuk.go.kr/www/contents.do?key=733");
	})

	$('.Seoul > .gangseogu').click(function() {
		newView("https://www.gangseo.seoul.kr/new_portal/living/recycle.jsp");
	})

	$('.Seoul > .gwanakgu').click(function() {
		newView("https://www.gwanak.go.kr/site/gwanak/07/10703010200002016051206.jsp");
	})

	$('.Seoul > .gwangjingu').click(function() {
		newView("https://www.gwangjin.go.kr/portal/main/contents.do?menuNo=200842");
	})

	$('.Seoul > .gurogu').click(function() {
		newView("https://guro.go.kr/www/contents.do?key=2697&");
	})

	$('.Seoul > .geumchungu').click(function() {
		newView("https://www.geumcheon.go.kr/portal/contents.do?key=820");
	})

	$('.Seoul > .nowongu').click(function() {
		newView("https://www.nowon.kr/www/minwon/minwon4/minwon4_03/minwon4_03_04.jsp");
	})

	$('.Seoul > .dobonggu').click(function() {
		newView("https://www.dobong.go.kr/subsite/waste/Contents.asp?code=10007366");
	})

	$('.Seoul > .dongdaemoongu').click(function() {
		newView("https://www.ddm.go.kr/life/garbageDischarge.jsp");
	})

	$('.Seoul > .dongjakgu').click(function() {
		newView("https://www.dongjak.go.kr/portal/main/contents.do?menuNo=200592");
	})

	$('.Seoul > .mapogu').click(function() {
		newView("https://www.mapo.go.kr/site/main/content/mapo05060501");
	})

	$('.Seoul > .seodaemoongu').click(function() {
		newView("https://m.blog.naver.com/PostView.nhn?blogId=cgdc_blog&logNo=221371703287&proxyReferer=https:%2F%2Fwww.google.com%2F");
	})

	$('.Seoul > .seochogu').click(function() {
		newView("https://www.seocho.go.kr/site/seocho/04/10411010600002018030711.jsp");
	})

	$('.Seoul > .seongdonggu').click(function() {
		newView("https://www.sd.go.kr/main/contents.do?key=1676&");
	})

	$('.Seoul > .seongbukgu').click(function() {
		newView("https://m.blog.naver.com/jungenius77/221749720628");
	})

	$('.Seoul > .songpagu').click(function() {
		newView("https://www.songpa.go.kr/www/contents.do?key=3164&");
	})

	$('.Seoul > .yangcheongu').click(function() {
		newView("https://www.yangcheon.go.kr/site/yangcheon/ex/bbs/List.do?cbIdx=279");
	})

	$('.Seoul > .yeongdengpogu').click(function() {
		newView("https://www.ydp.go.kr/www/contents.do?key=2733&");
	})

	$('.Seoul > .yongsangu').click(function() {
		newView("https://www.yongsan.go.kr/pms/contents/contents.do?contseqn=304&sitecdv=S0001301&menucdv=03030000&decorator=user13Ev");
	})

	$('.Seoul > .enpyonggu').click(function() {
		newView("https://www.ep.go.kr/CmsWeb/viewPage.req?idx=PG0000003979");
	})

	$('.Seoul > .jongrogu').click(function() {
		newView("https://www.jongno.go.kr/Main.do?menuNo=1365");
	})

	$('.Seoul > .joonggu').click(function() {
		newView("https://www.gov.kr/portal/locgovNews/2023984");
	})

	$('.Seoul > .joongranggu').click(function() {
		newView("https://www.jungnang.go.kr/portal/main/contents.do?menuNo=200052");
	})
	//서울 끝

	// 부산광역시
	$('.Busan > .joonggu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .seogu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .donggu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .youngdogu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .busanjingu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .dongraegu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .namgu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .bukgu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .haeundaegu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .sahagu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .geumjeonggu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .gangseogu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .yeonjaegu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .sooyounggu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .sasanggu').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	$('.Busan > .gijanggun').click(function() {
		newView("https://blog.naver.com/suhbs8680/196880197");
	})

	// 대구 광역시
	$('.Daegu > .joonggu').click(function() {
		newView("https://www.jung.daegu.kr/new/pages/information/page.html?mc=0273");
	})

	$('.Daegu > .donggu').click(function() {
		newView("https://www.dong.daegu.kr/main/page.htm?mnu_uid=387&");
	})

	$('.Daegu > .seogu').click(function() {
		newView("https://www.dgs.go.kr/dgs/minwon/page.php?mnu_uid=11027");
	})

	$('.Daegu > .namgu').click(function() {
		newView("https://www.nam.daegu.kr/index.do?menu_id=00000777");
	})

	$('.Daegu > .bukgu').click(function() {
		newView("https://www.buk.daegu.kr/index.do?menu_id=00001792");
	})

	$('.Daegu > .sooseonggu').click(function() {
		newView("https://www.suseong.kr/index.do;jsessionid=AD9E3103D2E2A7446AC8016C85F1294C.tomcat_main2?menu_id=00000359&servletPath=%2Findex.do");
	})

	$('.Daegu > .dalseogu').click(function() {
		newView("https://dalseo.daegu.kr/index.do;jsessionid=86EC11F2DDEF83AECD2A7F3B1FFE441B.tomcat1?menu_id=00001251&servletPath=%2Findex.do");
	})

	$('.Daegu > .dalseolgun').click(function() {
		newView("https://www.dalseong.daegu.kr/index.do;jsessionid=C7F1C7B4BA67BCCCCED4B2E4B26FDB4F.tomcat2?menu_id=00000365&servletPath=%2Findex.do");
	})

	//인천 시작
	$('.Incheon > .joonggu').click(function() {
		newView("https://www.icjg.go.kr/krpt0401c");
	})

	$('.Incheon > .donggu').click(function() {
		newView("https://m.blog.naver.com/PostView.nhn?blogId=lawon2018&logNo=221671104291&proxyReferer=https:%2F%2Fwww.google.com%2F");
	})

	$('.Incheon > .michuholgu').click(function() {
		newView("https://www.michuhol.go.kr/main/content.do?sq=446");
	})

	$('.Incheon > .yeonsugu').click(function() {
		newView("https://www.yeonsu.go.kr/main/part/clean/recycle.asp");
	})

	$('.Incheon > .namdonggu').click(function() {
		newView("https://www.namdong.go.kr/main/area/clean/garbage.jsp");
	})

	$('.Incheon > .bupyounggu').click(function() {
		newView("https://www.icbp.go.kr/main/life/clean/recycle_trick.jsp");
	})

	$('.Incheon > .gyeyanggu').click(function() {
		newView("https://www.gyeyang.go.kr/open_content/main/part/clean/recycle.jsp");
	})

	$('.Incheon > .seogu').click(function() {
		newView("https://www.seo.incheon.kr/open_content/main/part/clean/detritus.jsp");
	})

	$('.Incheon > .ganghwagun').click(function() {
		newView("https://www.ganghwa.go.kr/open_content/main/part/clean/detritus_recycle.jsp");
	})

	$('.Incheon > .ongjingun').click(function() {
		newView("https://www.ongjin.go.kr/open_content/main/environment/cleaning/recycle.jsp");
	})
	//인천 끝

	// 광주 광역시
	$('.Gwangju > .donggu').click(function() {
		newView("https://www.donggu.kr/download.es?filename=1530663243390.pdf&filenameOrg=04080103-file.pdf&f_path=board&bid=ATT&type=board&list_no=14800&seq=1");
	})

	$('.Gwangju > .seogu').click(function() {
		newView("https://www.seogu.go.kr/kor/content.do?mnucd=SGMENU0100225");
	})

	$('.Gwangju > .namgu').click(function() {
		newView("https://www.namgu.gwangju.kr/menu.es?mid=a10501050000");
	})

	$('.Gwangju > .bukgu').click(function() {
		newView("https://www.buk.daegu.kr/index.do?menu_id=00001792");
	})

	$('.Gwangju > .gwangsangu').click(function() {
		newView("https://www.gwangsan.go.kr/co/contentsView.php?pageID=gwangsan0406020103");
	})

	//대전 시작

	$('.Daejeon > .donggu').click(function() {
		newView("https://www.donggu.go.kr/dg/kor/contents/618");
	})

	$('.Daejeon > .joonggu').click(function() {
		newView("https://www.djjunggu.go.kr/kr/sub06_05_09_05.do");
	})

	$('.Daejeon > .seogu').click(function() {
		newView("https://www.seogu.go.kr/kor/content.do?mnucd=SGMENU0100225");
	})

	$('.Daejeon > .yooseonggu').click(function() {
		newView("https://www.yuseong.go.kr/?page_id=16808");
	})

	$('.Daejeon > .daedeokgu').click(function() {
		newView("http://www.daedeok.go.kr/was/goContents.do?link=/was/was01/WAS010206&menuId=WAS010206");
	})
	//대전 끝

	// 울산 광역시
	$('.Ulsan > .joonggu').click(function() {
		newView("https://www.junggu.ulsan.kr/index.ulsan?menuCd=DOM_000000301007002002");
	})

	$('.Ulsan > .namgu').click(function() {
		newView("https://www.ulsannamgu.go.kr/fieldInfo/recyclingWaste01.jsp");
	})

	$('.Ulsan > .donggu').click(function() {
		newView("https://www.donggu.ulsan.kr/donggu/partInfo/envWaste/envWaste07.jsp");
	})

	$('.Ulsan > .bukgu').click(function() {
		newView("https://www.bukgu.ulsan.kr/lay1/S1T211C365/contents.do");
	})

	$('.Ulsan > .uljugun').click(function() {
		newView("https://www.ulju.ulsan.kr/ulju/sect_inf05_01_03");
	})

	//세종시 시작
	$('.Sejong > .sejongsi').click(function() {
		newView("https://www.sejong.go.kr/bbs/R0071/view.do?nttId=B000000017381Ax3cU9b&mno=sub02_01");
	})
	//세종시 끝

	// 경기도 시작
	$('.Gyeonggi > .goyangsi').click(function() {
		newView("http://www.goyang.go.kr/www/user/bbs/BD_selectBbs.do?q_bbsCode=1030&q_bbscttSn=20210203162545118");
	})

	$('.Gyeonggi > .gwacheonsi').click(function() {
		newView("https://www.gccity.go.kr/main/board/bbs.do?mCode=B010010000&dongNm=&cfgIdx=2&op=view&idxId=96843");
	})

	$('.Gyeonggi > .gwangmyeongsi').click(function() {
		newView("https://www.gm.go.kr/pt/user/bbs/BD_selectBbs.do?q_bbsCode=2044&q_bbscttSn=20190115103427771");
	})

	$('.Gyeonggi > .gwangjusi').click(function() {
		newView("https://www.gjcity.go.kr/portal/bbs/view.do?bIdx=292226&ptIdx=1&mId=0201010000");
	})

	$('.Gyeonggi > .gulisi').click(function() {
		newView("https://www.guri.go.kr/cms/content/view/3948");
	})

	$('.Gyeonggi > .gunposi').click(function() {
		newView("https://www.gunpo.go.kr/www/selectBbsNttView.do?key=3890&bbsNo=675&nttNo=256500");
	})

	$('.Gyeonggi > .gimposi').click(function() {
		newView("https://www.gimpo.go.kr/portal/selectBbsNttView.do?key=3357&bbsNo=50&nttNo=304384");
	})

	$('.Gyeonggi > .namyangjusi').click(function() {
		newView("https://www.nyj.go.kr/main/559");
	})

	$('.Gyeonggi > .dongducheonsi').click(function() {
		newView("https://www.ddc.go.kr/ddc/selectBbsNttView.do?key=104&bbsNo=24&nttNo=86652");
	})

	$('.Gyeonggi > .bucheonsi').click(function() {
		newView("http://bucheon.go.kr/site/homepage/menu/viewMenu?menuid=148006007006003");
	})

	$('.Gyeonggi > .seongnamsi').click(function() {
		newView("https://www.seongnam.go.kr/city/1000384/143/10237/subTabCont.do?");
	})

	$('.Gyeonggi > .suwonsi').click(function() {
		newView("https://www.suwon.go.kr/sw-www/deptHome/dep_env/env_03/env_03_09.jsp");
	})

	$('.Gyeonggi > .siheungsi').click(function() {
		newView("https://www.siheung.go.kr/portal/contents.do?mId=0703010300");
	})

	$('.Gyeonggi > .ansansi').click(function() {
		newView("https://www.ansan.go.kr/www/contents.do?key=516");
	})

	$('.Gyeonggi > .anseongsi').click(function() {
		newView("https://www.anseong.go.kr/depart/contents.do?mId=0701000000");
	})

	$('.Gyeonggi > .anyangsi').click(function() {
		newView("https://www.anyang.go.kr/main/contents.do?key=806");
	})

	$('.Gyeonggi > .yangjusi').click(function() {
		newView("https://www.yangju.go.kr/www/contents.do?key=689");
	})

	$('.Gyeonggi > .yeojusi').click(function() {
		newView("https://www.yeoju.go.kr/cms/content/view/802");
	})

	$('.Gyeonggi > .osansi').click(function() {
		newView("https://www.osan.go.kr/depart/contents.do?mId=0602010000");
	})

	$('.Gyeonggi > .yonginsi').click(function() {
		newView("https://www.yongin.go.kr/home/www/www12/www12_01/www12_01_08/www12_01_08_05.jsp;jsessionid=HKEj6xAJudTULS4V14Xms3BpwkgetLyRF9mAmA4ILdRpSWc1Jjbfcjx0f53XeIpp.yonginwas2_servlet_engine3");
	})

	$('.Gyeonggi > .uiwangsi').click(function() {
		newView("https://www.uiwang.go.kr/UWKORENV0301");
	})

	$('.Gyeonggi > .uijeongbusi').click(function() {
		newView("https://www.ui4u.go.kr/depart/contents.do?mId=0602000000");
	})

	$('.Gyeonggi > .icheonsi').click(function() {
		newView("https://www.icheon.go.kr/depart/contents.do?key=2316");
	})

	$('.Gyeonggi > .pajusi').click(function() {
		newView("https://www.paju.go.kr/www/www_02/environment/environment_05/environment_05_01/environment_05_01_01.jsp");
	})

	$('.Gyeonggi > .pyeongtaegsi').click(function() {
		newView("https://www.pyeongtaek.go.kr/pyeongtaek/contents.do?mId=1600000000");
	})

	$('.Gyeonggi > .pocheonsi').click(function() {
		newView("https://www.pocheon.go.kr/www/contents.do?key=4595");
	})

	$('.Gyeonggi > .hanamsi').click(function() {
		newView("https://www.hanam.go.kr/www/contents.do?key=6421");
	})

	$('.Gyeonggi > .hwaseongsi').click(function() {
		newView("https://www.hscity.go.kr/www/partInfo/trnsportEnvrn/trashProcessInfo.jsp");
	})

	$('.Gyeonggi > .gapyeonggun').click(function() {
		newView("https://www.gp.go.kr/portal/contents.do?key=2187");
	})

	$('.Gyeonggi > .yangpyeonggun').click(function() {
		newView("https://www.yp21.go.kr/www/contents.do?key=1458");
	})

	$('.Gyeonggi > .yeoncheongun').click(function() {
		newView("https://www.yeoncheon.go.kr/www/contents.do?key=3502");
	})
	// 경기도 끝

	// 강원도
	$('.Gangwon > .gangleungsi').click(function() {
		newView("https://www.gn.go.kr/www/contents.do?key=466");
	})

	$('.Gangwon > .donghaesi').click(function() {
		newView("https://www.dh.go.kr/pages/sub.htm?nav_code=dh1472471334");
	})

	$('.Gangwon > .samcheogsi').click(function() {
		newView("https://www.samcheok.go.kr/specialty/00469/00686.web");
	})

	$('.Gangwon > .sogchosi').click(function() {
		newView("https://www.sokchosiseol.or.kr/biz/recycle.do");
	})

	$('.Gangwon > .wonjusi').click(function() {
		newView("https://www.wonju.go.kr/www/contents.do?key=543&");
	})

	$('.Gangwon > .chuncheonsi').click(function() {
		newView("http://www.chuncheon.go.kr/index.chuncheon?menuCd=DOM_000000503003001001");
	})

	$('.Gangwon > .taebaegsi').click(function() {
		newView("https://www.taebaek.go.kr/www/contents.do?key=1615");
	})

	$('.Gangwon > .goseonggun').click(function() {
		newView("hhttps://www.gwgs.go.kr/kor/sub06_050304.do");
	})

	$('.Gangwon > .yanggugun').click(function() {
		newView("https://www.yanggu.go.kr/user_sub.php?gid=www&bcd=pre_info&bk=UBIHN1617869684&mu_idx=511&bt=rd");
	})

	$('.Gangwon > .yangyanggun').click(function() {
		newView("https://www.yangyang.go.kr/gw/portal/yyc_partinfo_envi_recy");
	})

	$('.Gangwon > .yeongwolgun').click(function() {
		newView("https://www.yw.go.kr/www/selectBbsNttList.do?key=473&bbsNo=44&searchCtgry=&pageUnit=10&searchCnd=SJ&searchKrwd=%EB%B0%B0%EC%B6%9C&integrDeptCode=&pageIndex=1");
	})

	$('.Gangwon > .injegun').click(function() {
		newView("https://www.inje.go.kr/portal/adm/notice?articleSeq=154539");
	})

	$('.Gangwon > .jeongseongun').click(function() {
		newView("https://www.jeongseon.go.kr/portal/partinfo/environment_forest/waste/separationguide");
	})

	$('.Gangwon > .cheolwongun').click(function() {
		newView("https://www.cwg.go.kr/www/contents.do?key=426");
	})

	$('.Gangwon > .pyeongchanggun').click(function() {
		newView("https://pc.go.kr/portal/government/government-news/government-news-agency");
	})

	$('.Gangwon > .hongcheongun').click(function() {
		newView("https://www.hongcheon.go.kr/www/contents.do?key=628");
	})

	$('.Gangwon > .hwacheongun').click(function() {
		newView("https://www.ihc.go.kr/www/contents.do?key=298");
	})

	$('.Gangwon > .hoengseonggun').click(function() {
		newView("http://www.hsg.go.kr/portal/html/sub/06_06_05_02.jsp");
	})

	//충북 시작
	$('.Chungcheongbugdo > .jecheonsi').click(function() {
		newView("https://www.jecheon.go.kr/downloadBbsFile.do?atchmnflNo=150571");
	})

	$('.Chungcheongbugdo > .cheongjusi').click(function() {
		newView("https://www.cheongju.go.kr/cheongwon/contents.do?key=1292");
	})

	$('.Chungcheongbugdo > .chungjusi').click(function() {
		newView("https://www.chungju.go.kr/www/contents.do?key=657");
	})

	$('.Chungcheongbugdo > .goesangun').click(function() {
		newView("https://www.goesan.go.kr/trenv/contents.do?key=421");
	})

	$('.Chungcheongbugdo > .danyanggun').click(function() {
		newView("https://www.danyang.go.kr/dy21/856");
	})

	$('.Chungcheongbugdo > .boeungun').click(function() {
		newView("http://www.boeun.go.kr/www/selectBbsNttView.do?key=1073&bbsNo=131&nttNo=153510");
	})

	$('.Chungcheongbugdo > .yeongdonggun').click(function() {
		newView("https://www.yd21.go.kr/kr/html/sub05/05060302.html");
	})

	$('.Chungcheongbugdo > .ogcheongun').click(function() {
		newView("https://www.oc.go.kr/www/contents.do?key=339&");
	})

	$('.Chungcheongbugdo > .eumseonggun').click(function() {
		newView("https://www.eumseong.go.kr/www/contents.do?key=7829");
	})

	$('.Chungcheongbugdo > .jeungpyeonggun').click(function() {
		newView("https://www.jp.go.kr/kor/sub05_07_02.do");
	})

	$('.Chungcheongbugdo > .jincheongun').click(function() {
		newView("https://www.jincheon.go.kr/site/environment/sub.do?menukey=1517");
	})
	//충북 끝

	// 충청남도 시작
	$('.Chungcheongnamdo > .gyelyongsi').click(function() {
		newView("https://www.gyeryong.go.kr/_prog/_board/common/download.php?code=m4_10_01&ntt_no=rDzgrrerhGjsC9gGYZDIHA&atch_no=2");
	})
	$('.Chungcheongnamdo > .gongjusi').click(function() {
		newView("https://www.gongju.go.kr/kr/sub06_08_06_03.do");
	})
	$('.Chungcheongnamdo > .nonsansi').click(function() {
		newView("https://www.nonsan.go.kr/kor/html/sub05/05081101.html");
	})
	$('.Chungcheongnamdo > .dangjinsi').click(function() {
		newView("https://www.dangjin.go.kr/kor/sub05_09_07_01.do");
	})
	$('.Chungcheongnamdo > .bolyeongsi').click(function() {
		newView("https://www.brcn.go.kr/kor/sub05_07_02.do");
	})
	$('.Chungcheongnamdo > .seosansi').click(function() {
		newView("https://www.seosan.go.kr/www/contents.do?key=1568");
	})
	$('.Chungcheongnamdo > .asansi').click(function() {
		newView("https://www.asan.go.kr/main/cms/?no=293");
	})
	$('.Chungcheongnamdo > .cheonansi').click(function() {
		newView("https://www.cheonan.go.kr/kor/sub05_08_02.do");
	})
	$('.Chungcheongnamdo > .geumsangun').click(function() {
		newView("https://www.geumsan.go.kr/kr/html/sub05/05050602.html");
	})
	$('.Chungcheongnamdo > .buyeogun').click(function() {
		newView("https://www.buyeo.go.kr/html/kr/refo/refo_06040402.html");
	})
	$('.Chungcheongnamdo > .seocheongun').click(function() {
		newView("https://www.seocheon.go.kr/kor/sub07_04_04_02.do");
	})
	$('.Chungcheongnamdo > .yesangun').click(function() {
		newView("https://www.yesan.go.kr/kor/sub05_06_06.do");
	})
	$('.Chungcheongnamdo > .cheongyanggun').click(function() {
		newView("http://www.cheongyang.go.kr/kor/sub06_04_07.do");
	})
	$('.Chungcheongnamdo > .taeangun').click(function() {
		newView("#");
	})
	$('.Chungcheongnamdo > .hongseonggun').click(function() {
		newView("http://www.hongseong.go.kr/kor/sub05_090205.do");
	})
	// 충청남도 끝

	//전북 시작
	$('.Jeollabugdo > .gunsansi').click(function() {
		newView("https://www.gunsan.go.kr/main/m250#");
	})

	$('.Jeollabugdo > .gimjesi').click(function() {
		newView("https://www.gimje.go.kr/index.gimje?menuCd=DOM_000000106002002000");
	})

	$('.Jeollabugdo > .namwonsi').click(function() {
		newView("http://www.namwon.go.kr/index.do?menuCd=DOM_000000203004004000");
	})

	$('.Jeollabugdo > .igsansi').click(function() {
		newView("https://www.iksan.go.kr/index.iksan?menuCd=DOM_000002015002003000");
	})

	$('.Jeollabugdo > .jeonjusi').click(function() {
		newView("http://www.jeonju.go.kr/index.9is?contentUid=9be517a74f8dee91014f9225bf401116");
	})

	$('.Jeollabugdo > .jeongeubsi').click(function() {
		newView("http://www.jeongeup.go.kr/buseo/board/view.jeongeup?menuCd=DOM_000001015002000000&boardId=BBS_0000012&dataSid=254421");
	})

	$('.Jeollabugdo > .gochanggun').click(function() {
		newView("https://www.gochang.go.kr/index.gochang?menuCd=DOM_000000104004001003");
	})

	$('.Jeollabugdo > .mujugun').click(function() {
		newView("https://www.muju.go.kr/planweb/board/view.9is?dataUid=ff8080817272ab6101738e9cec4f3276&page=1&boardUid=ff8080816d135a54016d1ecde9d8001a&contentUid=ff8080816c5f9d47016cbd3ae19f006b");
	})

	$('.Jeollabugdo > .buangun').click(function() {
		newView("https://www.buan.go.kr/board/view.buan?menuCd=DOM_000000103001001000&boardId=BBS_0000053&startPage=1&dataSid=103103&contentsSid=687");
	})

	$('.Jeollabugdo > .sunchanggun').click(function() {
		newView("https://www.sunchang.go.kr/index.sunchang?menuCd=DOM_000000105004003002");
	})

	$('.Jeollabugdo > .wanjugun').click(function() {
		newView("https://www.wanju.go.kr/index.wanju?menuCd=DOM_000000104005005003");
	})

	$('.Jeollabugdo > .imsilgun').click(function() {
		newView("#");
	})

	$('.Jeollabugdo > .jangsugun').click(function() {
		newView("https://www.jangsu.go.kr/index.jangsu?menuCd=DOM_000000406009002000");
	})

	$('.Jeollabugdo > .jinangun').click(function() {
		newView("https://www.jinan.go.kr/index.jinan?menuCd=DOM_000000110004000000");
	})
	//전북 끝

	//전라남도 시작!!
	$('.Jeonlanamdo > .gwangyangsi').click(function() {
		newView("https://www.gwangyang.go.kr/index.gwangyang?menuCd=DOM_000000105005009003");
	})

	$('.Jeonlanamdo > .najusi').click(function() {
		newView("http://www.naju.go.kr/www/field_info/large_waste/guide");
	})

	$('.Jeonlanamdo > .mogposi').click(function() {
		newView("http://www.mokpo.go.kr/www/civil_complaint/field_complaint/large_waste/notice?mode=view&idx=293570");
	})

	$('.Jeonlanamdo > .suncheonsi').click(function() {
		newView("https://www.suncheon.go.kr/kr/life/0002/0003/");
	})

	$('.Jeonlanamdo > .yeosusi').click(function() {
		newView("http://www.yumcorp.or.kr/inc.php?inc=menu2_2");
	})

	$('.Jeonlanamdo > .hampyeonggun').click(function() {
		newView("https://www.hampyeong.go.kr/boardView.do?pageId=www272&boardId=NOTICE&seq=213647364");
	})

	$('.Jeonlanamdo > .gangjingun').click(function() {
		newView("https://www.gangjin.go.kr/www/government/news/notice?mode=view&idx=487723");
	})

	$('.Jeonlanamdo > .goheunggun').click(function() {
		newView("https://www.goheung.go.kr/environmental/contentsView.do?pageId=environmental16");
	})

	$('.Jeonlanamdo > .gogseonggun').click(function() {
		newView("https://www.gokseong.go.kr/main/?pid=435&act=view&SEQ=7888");
	})

	$('.Jeonlanamdo > .gulyegun').click(function() {
		newView("https://www.gurye.go.kr/kr/subPage.do?menuNo=117004005001");
	})

	$('.Jeonlanamdo > .haenamgun').click(function() {
		newView("http://www.haenam.go.kr/index.9is?contentUid=18e3368f5d745106015e51afeffd340f");
	})

	$('.Jeonlanamdo > .damyanggun').click(function() {
		newView("http://www.damyang.go.kr/index.damyang?menuCd=DOM_000000107009002000");
	})

	$('.Jeonlanamdo > .muangun').click(function() {
		newView("https://www.muan.go.kr/www/information/environment_facilities/recycling/collection");
	})

	$('.Jeonlanamdo > .boseonggun').click(function() {
		newView("https://www.boseong.go.kr/www/open_data/environment/recycle");
	})

	$('.Jeonlanamdo > .sinangun').click(function() {
		newView("https://www.shinan.go.kr/home/www/dept_info/env/waste");
	})

	$('.Jeonlanamdo > .yeonggwanggun').click(function() {
		newView("https://www.yeonggwang.go.kr/subpage/?site=headquarter&mn=1123");
	})

	$('.Jeonlanamdo > .yeongamgun').click(function() {
		newView("https://www.yeongam.go.kr/home/www/info_area/life_env/life_env_01/life_env_01_05/yeongam.go");
	})

	$('.Jeonlanamdo > .wandogun').click(function() {
		newView("https://www.wando.go.kr/www/administration/news/notice?mode=view&idx=136233");
	})

	$('.Jeonlanamdo > .jangseonggun').click(function() {
		newView("https://www.jangseong.go.kr/home/www/openinfo/environment/environment_21/show/59");
	})

	$('.Jeonlanamdo > .jangheunggun').click(function() {
		newView("https://www.jangheung.go.kr/www/open_data/life_environment");
	})

	$('.Jeonlanamdo > .jindogun').click(function() {
		newView("https://www.jindo.go.kr/home/sub.cs?m=334");
	})

	$('.Jeonlanamdo > .hwasungun').click(function() {
		newView("#");
	})
	//전남 끝

	//경상북도 시작!!
	$('.Gyeongsangbugdo > .gyeongsansi').click(function() {
		newView("https://www.gbgs.go.kr/open_content/ko/page.do?mnu_uid=2219&");
	})

	$('.Gyeongsangbugdo > .gyeongjusi').click(function() {
		newView("https://www.gyeongju.go.kr/area/page.do?mnu_uid=1011&");
	})

	$('.Gyeongsangbugdo > .golyeonggun').click(function() {
		newView("https://www.goryeong.go.kr/doc/document.html?fn=%EC%93%B0%EB%A0%88%EA%B8%B0%EB%B0%B0%EC%B6%9C%EC%9A%94%EB%A0%B9.jpg&rs=2021043");
	})

	$('.Gyeongsangbugdo > .gumisi').click(function() {
		newView("https://www.gumi.go.kr/portal/contents.do?mId=0608040000");
	})

	$('.Gyeongsangbugdo > .gunwigun').click(function() {
		newView("https://www.gunwi.go.kr/ko/page.do?mnu_uid=315&");
	})

	$('.Gyeongsangbugdo > .gimcheonsi').click(function() {
		newView("http://work.gc.go.kr/administration/page.htm?mnu_siteid=inno&mnu_uid=3819&");
	})

	$('.Gyeongsangbugdo > .mungyeongsi').click(function() {
		newView("https://www.gbmg.go.kr/portal/contents.do?mId=0606040101");
	})

	$('.Gyeongsangbugdo > .bonghwagun').click(function() {
		newView("https://www.bonghwa.go.kr/open.content/ko/welfare/environment/trash.come.forth/");
	})

	$('.Gyeongsangbugdo > .sangjusi').click(function() {
		newView("https://www.sangju.go.kr/civil/page/2596/1710.tc?protocol=http");
	})

	$('.Gyeongsangbugdo > .seongjugun').click(function() {
		newView("https://www.sj.go.kr/tour/page.do?mnu_uid=1231&");
	})

	$('.Gyeongsangbugdo > .andongsi').click(function() {
		newView("https://www.gb.go.kr/open_content/newcity_m/index.jsp?LARGE_CODE=821&MEDIUM_CODE=20&SMALL_CODE=30&SMALL_CODE2=30&SMALL_CODE3=&target=main&URL=/open_content/newcity_m/andong/andong11.html&menu_code=03931");
	})

	$('.Gyeongsangbugdo > .yeongdeoggun').click(function() {
		newView("https://www.yd.go.kr/?p=604");
	})

	$('.Gyeongsangbugdo > .yeongyanggun').click(function() {
		newView("https://www.yyg.go.kr/www/welfare/life_info/waste_discharge");
	})

	$('.Gyeongsangbugdo > .yeongjusi').click(function() {
		newView("https://www.yeongju.go.kr/bigclean/bcInfo/bcInfo.jsp");
	})

	$('.Gyeongsangbugdo > .yeongcheonsi').click(function() {
		newView("https://www.yc.go.kr/depart/contents.do?mId=0505000000");
	})

	$('.Gyeongsangbugdo > .yecheongun').click(function() {
		newView("https://www.ycg.kr/open.content/ko/section/environment/environment/");
	})

	$('.Gyeongsangbugdo > .ulleunggun').click(function() {
		newView("https://ulleung.go.kr/m/page.htm?mnu_uid=1273&msg_no=119020&procStep=read&pageno=2");
	})

	$('.Gyeongsangbugdo > .uljingun').click(function() {
		newView("http://www.uljin.go.kr/index.uljin?menuCd=DOM_000000106003001001&cpath=");
	})

	$('.Gyeongsangbugdo > .uiseonggun').click(function() {
		newView("https://www.usc.go.kr/page/1375/1454.tc");
	})

	$('.Gyeongsangbugdo > .cheongdogun').click(function() {
		newView("#");
	})

	$('.Gyeongsangbugdo > .cheongsonggun').click(function() {
		newView("https://www.law.go.kr/%EC%9E%90%EC%B9%98%EB%B2%95%EA%B7%9C/%EC%B2%AD%EC%86%A1%EA%B5%B0%EC%83%9D%ED%99%9C%ED%8F%90%EA%B8%B0%EB%AC%BC%EA%B4%80%EB%A6%AC%EC%A1%B0%EB%A1%80/(1933,20150812)");
	})

	$('.Gyeongsangbugdo > .chilgoggun').click(function() {
		newView("https://car.chilgok.go.kr/portal/contents.do?mId=1108010100");
	})

	$('.Gyeongsangbugdo > .pohangsi').click(function() {
		newView("https://landrich.tistory.com/513");
	})
	//경상북도 끝!!

	//경상남도 시작
	$('.Gyeongsangnamdo > .geojesi').click(function() {
		newView("https://www.geoje.go.kr/board/view.geoje?boardId=BBS_0000008&menuCd=DOM_000008902001001000&dataSid=305976246&contentsSid=9633");
	})

	$('.Gyeongsangnamdo > .gimhaesi').click(function() {
		newView("https://www.gimhae.go.kr/01544/02643/01739.web");
	})

	$('.Gyeongsangnamdo > .milyangsi').click(function() {
		newView("https://www.miryang.go.kr/web/index.do?mnNo=50201000000");
	})

	$('.Gyeongsangnamdo > .sacheonsi').click(function() {
		newView("https://www.sacheon.go.kr/intro/01126/03723.web?gcode=2864&idx=2013576&amode=view&sstring=%EC%9E%AC%ED%99%9C%EC%9A%A9&__encrypted=lrbN9iENvnepaDcMaSycIXxCt%2FggO5LZ4g%2B5U6WiSpf7Bf8dBuM1np5hKsgkxkaLR75OwSMPizH3JH1eQwRGmKRYpjuOKDduqJnZnaDY0AXeTbSeVq%2Brpg6HChlr%2BD234xy1CJALH3rvywUoAKPzYU2Rv9%2BjqnEJyd0R6xhEW4IUfIMyDx42O25ZMQXI1lNBTqPCR1mMt06NMpCXzgvF0CpQkJQnLhbC%2FKF8LfkFTSnvf4cE4HwA4couOMGmCV7mAZ1bqYCA3OI%3D&stype=title&cpage=1");
	})

	$('.Gyeongsangnamdo > .yangsansi').click(function() {
		newView("https://www.yangsan.go.kr/recycle/contents.do?mId=0301000000");
	})

	$('.Gyeongsangnamdo > .jinjusi').click(function() {
		newView("https://www.jinju.go.kr/00134/00615/00870.web");
	})

	$('.Gyeongsangnamdo > .changwonsi').click(function() {
		newView("https://www.changwon.go.kr/depart/contents.do?mId=1005010100");
	})

	$('.Gyeongsangnamdo > .tongyeongsi').click(function() {
		newView("https://www.tongyeong.go.kr/00973/01112/01985.web");
	})

	$('.Gyeongsangnamdo > .geochanggun').click(function() {
		newView("https://www.geochang.go.kr/news/board/View.do?gcode=1002&idx=14025197&pageCd=NW0101000000&siteGubun=portal");
	})

	$('.Gyeongsangnamdo > .goseonggun').click(function() {
		newView("https://www.gwgs.go.kr/kor/sub06_050304.do");
	})

	$('.Gyeongsangnamdo > .namhaegun').click(function() {
		newView("https://www.namhae.go.kr/life/Index.do?c=LF0204000000");
	})

	$('.Gyeongsangnamdo > .sancheonggun').click(function() {
		newView("https://www.sancheong.go.kr/www/contents.do?key=300");
	})

	$('.Gyeongsangnamdo > .Gyeongsangnamdo > .uilyeonggun').click(function() {
		newView("http://www.uiryeong.go.kr/index.uiryeong?menuCd=DOM_000000405008002001");
	})

	$('.Gyeongsangnamdo > .changnyeonggun').click(function() {
		newView("https://www.cng.go.kr/news/00000372/00000373.web?amode=view&gcode=1001&idx=524767");
	})

	$('.Gyeongsangnamdo > .hadonggun').click(function() {
		newView("https://www.hadong.go.kr/specialty/00219/00477.web");
	})

	$('.Gyeongsangnamdo > .hamangun').click(function() {
		newView("https://www.haman.go.kr/02852/02858/03249.web");
	})

	$('.Gyeongsangnamdo > .hamyanggun').click(function() {
		newView("https://www.hygn.go.kr/specialty/02201/00388.web");
	})

	$('.Gyeongsangnamdo > .habcheongun').click(function() {
		newView("https://www.hc.go.kr/05754/06019/06040.web");
	})
	//경상남도 끝!!

	//제주 시작
	$('.Jeju > .seogwiposi').click(function() {
		newView("https://www.jeju.go.kr/nature/environment/reform.htm");
	})

	$('.Jeju > .jejusi').click(function() {
		newView("https://www.jeju.go.kr/nature/environment/reform.htm");
	})
	//제주 끝

})


$(document).ready(function() {
	$('text').click(function() {
		var getCity = $(this).attr('id').substring(1);
		viewCity(getCity);
	})

	$('path').click(function() {
		var getCity = $(this).attr('id');
		viewCity(getCity);

	})
	function viewCity(city) {
		if (finalShow != city) {
			$('.' + finalShow).css('display', 'none');
			$('.' + finalShow + '> div').css('display', 'none');
			nowShow = false;
			finalShow = city;
		}
		if (nowShow == true) {
			$('.' + city).css('display', 'none');
			$('.' + city + '> div').css('display', 'none');
			nowShow = false;
		}
		else if (nowShow == false) {
			$('.' + city).css('display', 'block');
			$('.' + city + '> div').css('display', 'block');
			nowShow = true;
		}

	}

});

