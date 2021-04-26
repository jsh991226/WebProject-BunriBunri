function loadBoard(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "./loadBoard.jsp",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                alert("통신실패!!!!");
            },
            success : function(Parse_data){
                alert("통신 데이터 값 : " + Parse_data);
            }
             
        });
}