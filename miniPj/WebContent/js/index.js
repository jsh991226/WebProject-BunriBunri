$(document).on('click', '.boardPost', function(){
	location.href="./viewPost.jsp?postNum=" + $(this).attr('postNum');
});

function pageSet(page) {
	if ( nowPage != page) {
		nowPage = page;
		$("#boardBody > tr").remove();
		$("#boardNumBtn > li").removeClass("active");
		$("#boardNumBtn > li:eq("+nowPage+")").addClass("active");
		for(i=0; i< 10; i++ ){
			if (!(boardList[i+((nowPage-1)*10)])) break;
			//temp = boardList[i+((nowPage-1)*10)].split("|");
			var $tdCol1 = $("<td />");
			var $tdCol2 = $("<td />");
			var $tdCol3 = $("<td />");
			var $tdCol4 = $("<td />");
			var $tdCol5 = $("<td />");
			var	$tr = $("<tr class='boardPost' postNum='"+ temp[0] +"'/>");
			$tdCol1.text(temp[0]);
			$tdCol2.text(temp[4]);
			$tdCol3.text(temp[3]);
			$tdCol4.text(temp[5]);
			$tdCol5.text(temp[7]);
			//1번 그룹아이디
			//2번 그룹 올더
			//6번 content(게시글 내용)
			$tr.append($tdCol1);
			$tr.append($tdCol2);
			$tr.append($tdCol3);
			$tr.append($tdCol4);
			$tr.append($tdCol5);
			$("#boardBody").append($tr);
	  	}		
	}
	
}
 
function movePage(dir){
	if ((nowPage+dir) <= maxPage && (nowPage+dir) > 0) {
		pageSet((nowPage+dir));
	}
	
	
}




