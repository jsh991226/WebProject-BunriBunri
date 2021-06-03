$(document).on('click', '.boardPost', function() {
	location.href = "./viewPost.jsp?postNum=" + $(this).attr('postNum');
	//$("#mainView").load("./viewPost.jsp?postNum=" + $(this).attr('postNum'));
});
$("textarea.autosize").on('keydown keyup', function() {
	$(this).height(1).height($(this).prop('scrollHeight') + 12);
});
function alertTest() {
	Swal.fire({
		title: "테스트",
		text: "테스트용 달달한 얼렛",
		icon: 'success',
		confirmButtonColor: '#3085d6',
		confirmButtonText: '확인',
	})
}


function sideClick() {
	var duration = 300;
	$('.sidebar-toggle-btn').toggleClass('open')
	if ($('.sidebar-toggle-btn').hasClass('open')) {
		$('#sidebar').stop(true).animate({ left: '0px' }, duration);
		$('.sidebar-toggle-btn').stop(true).animate({ left: '265px' }, duration);
		$('.background').css('opacity', 1);
		$('.background').css('visibility', 'visible');
		$('.background').css('transition', 'all .35s');
		return;
	} else {
		$('#sidebar').stop(true).animate({ left: '-300px' }, duration);
		$('.sidebar-toggle-btn').stop(true).animate({ left: '335px' }, duration);
		$('.background').css('opacity', 0);
		$('.background').css('visibility', 'hidden');
		$('.background').css('transition', 'all .35s');
		return;
	}

}




function searchBtn() {
	var searchType = $("#searchType").val();
	var searchText = $("#boardSerach").val();
	alert(searchType + searchText);
}
function cutTitle(title) {
	cuttitle = title.split("");
	result = "";
	if (cuttitle.length() >= 18) {
		for (i = 0; i < 18; i++) result += cuttitle[i];
		result += "..."
	} else {
		result = title;
	}
	return result;

}



function viewPage(page) {

	if (page == "register") {
		//$("#register").css('display','block');
		$('#register').fadeIn();
	}
	if (page == "login") {
		//$("#register").css('display','block');
		$('#login').fadeIn();
	}
	if (page == "logout") {
		location.href = "./userLogout.jsp";
	}
	if (page == "board") {
		$("#mainView").load("./board.jsp");
	}
	if (page == "mypage") {
		$('#mypage').fadeIn();
	}
	if (page == "policy") {
		$("#mainView").load("./policy.jsp");
	}
	if (page == "CallCenter") {

		Swal.fire({
			title: "지원하지 않는 기능입니다",
			html: "아직 개발중인 게시판 입니다<br/>불편을 드려 죄송합니다",
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '수정',
			cancelButtonText: '취소'
		})		
	}

}

function replyDelete(postNum, replyID) {
	Swal.fire({
		title: "댓글을 삭제 하시겠습니까?",
		text: "삭제한 댓글은 복구할 수 없습니다",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.value) {
			location.href = "./deleteReply.jsp?postNum=" + postNum + "&replyID=" + replyID;
		}
	})
		

}





function deletePost(postNum) {
	Swal.fire({
		title: "게시물을 삭제 하시겠습니까?",
		text: "삭제한 게시물은 복구할 수 없습니다",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.value) {
		location.href = "./deletePost.jsp?postNum=" + postNum;
		}
	})	
	
	
}
function editPost(postNum) {

	Swal.fire({
		title: "게시물을 수정 하시겠습니까?",
		text: "수정된 게시물은 되돌릴 수 없습니다.",
		icon: 'question',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '수정',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.value) {
		$("#mainView").load("./editBoard.jsp?postNum=" + postNum);
		}
	})		
	
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





