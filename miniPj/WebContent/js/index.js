$(document).on('click', '.boardPost', function() {
	location.href = "./viewPost.jsp?postNum=" + $(this).attr('postNum');
});

function replyDelete(postNum, replyID) {
	var jbResult = confirm('[!] 댓글을 삭제 하시겠습니까?');
	if (jbResult) {
		location.href = "./deleteReply.jsp?postNum=" + postNum + "&replyID=" + replyID;
	} else {
		return;
	}
}

function deletePost(postNum) {
	var jbResult = confirm('[!] 게시물을 삭제 하시겠습니까?');
	if (jbResult) {
		location.href = "./deletePost.jsp?postNum=" + postNum;
	} else {
		return;
	}
}
function editPost(postNum) {
	var jbResult = confirm('[!] 게시물을 수정 하시겠습니까?');
	if (jbResult) {
		location.href = "./editBoard.jsp?postNum=" + postNum;
	} else {
		return;
	}
}


function rereplyWrite(postNum, replyID) {
	//location.href="./rereplyWrite.jsp?postNum=" + postNum+"&replyID=" + replyID;	
	$(".rrpTag").children().remove();
	$(".rereplyli" + replyID).load("./rereplyWrite.jsp?postNum=" + postNum + "&replyID=" + replyID);
}

function writeRereply(postNum, replyID) {
	location.href = "./writeRereplyAction.jsp?postNum=" + postNum + "&replyID=" + replyID + "&replyContent=" + $(".writeRereplyContents").val();
}

function fileUpload(fis) {
	var str = fis.value;
	var reader = new FileReader();
	const file = fis.files[0];
	if (!validImageType(file)) {   // 이미지 파일이 아니라면
		alert('이미지 파일이 아닙니다');
		$('#fileInput').val('');  // 폼 초기화
		return;
	}
	reader.onload = function(e) {
		$('#loadImg').attr('src', e.target.result);
		$('#loadImg').css('display', '');


	}
	reader.readAsDataURL(fis.files[0]);

}
function validImageType(image) {
	const result = (['image/jpeg', 'image/png', 'image/jpg'].indexOf(image.type) > -1);
	return result;
}




function pageSet(page) {
	if (nowPage != page) {
		nowPage = page;
		$("#boardBody > tr").remove();
		$("#boardNumBtn > li").removeClass("active");
		$("#boardNumBtn > li:eq(" + nowPage + ")").addClass("active");
		for (i = 0; i < 10; i++) {
			if (!(boardList[i + ((nowPage - 1) * 10)])) break;
			//temp = boardList[i+((nowPage-1)*10)].split("|");
			var $tdCol1 = $("<td />");
			var $tdCol2 = $("<td />");
			var $tdCol3 = $("<td />");
			var $tdCol4 = $("<td />");
			var $tdCol5 = $("<td />");
			var $tr = $("<tr class='boardPost' postNum='" + temp[0] + "'/>");
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

function movePage(dir) {
	if ((nowPage + dir) <= maxPage && (nowPage + dir) > 0) {
		pageSet((nowPage + dir));
	}


}




