<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/user/css/index.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {
	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	
	// Editor Setting 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
		elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함. 
		sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML 
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
		htParams : { 
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : true, 
		} 
	}); // 전송버튼 클릭이벤트 
	
	$("#savebutton").click(function(){ 
		//if(confirm("저장하시겠습니까?")) { 
			// id가 smarteditor인 textarea에 에디터에서 대입 
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			
			// 이부분에 에디터 validation 검증 
			if(validation()) { 
				$("#frm").submit(); 
			} 
		//} 
		}) 
	}); 
	
	// 필수값 Check 
	
	function validation(){ 
		var contents = $.trim(oEditors[0].getContents()); 
		if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
			
			alert("내용을 입력하세요."); 
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false; 
		} 
		return true; 
	}

	/* $("#firstpage").click(
		function() {
			$('#pg').val("1");
			$('#key').val("");
			$('#word').val("");
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */

	/* $(".mvpage").click(
		function() {
			$('#pg').val($(this).attr("move-page-no"));
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */

	/* $("#searchBtn").click(
		function() {
			$('#pg').val('1');
			$('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */
/* 		$(".posting").click(
			function(){
				$("#bNo").val($(this).attr("b-no"));
				$("#commonForm").attr("method", "get").attr(
						"action", "/view.bit").submit();	
		}); */
		
})
</script>
<style>
.nse_content{width:660px;height:500px}
</style>
</head>
<body>
<div class="line"></div>
		
		<div>
			<form id="writeForm" name="writeForm" method="post" action="" style="margin: 0px">
				<div id="attach_file_hdn"></div>
				<input type="hidden" name="bcode" value="${bcode }">
				<input type="hidden" name="pg" value="1">
				<input type="hidden" name="key" value="">
				<input type="hidden" name="word" value="">
				
				<table border="0" cellpadding="5" cellspacing="0" width="630" style="table-layout: fixed">
					<tr valign="top">
						<td width="95" nowrap style="padding-left: 8px; padding-top: 13px; font-size: 11pt;">
							<img src="${root}/img/board/e_dot.gif" width="4" height="4" border="0" align="absmiddle">
							<b>제목</b>
						</td>
						<td colspan="5">
							<input name="subject" id="subject" type="text" size="76" maxlength="150" class="inp_02 form-control" style="width: 300px; height: 35px; margin-top: 10px;" value="">
							<img src="${root}/img/board/i_info.gif" width="12" height="11" border="0" align="absmiddle" vspace="8" style="margin: 3 3 0 6">
							<font class="stext">최대 한글 75자,영문 150자</font><br>
					</tr>
					<tr>
						<td width="620" nowrap style="padding-left: 8px; padding-top: 14px; font-size: 11pt;"
							colspan="5"><img src="${root}/img/board/e_dot.gif" width="4"
							height="4" border="0" align="absmiddle"> <b>글내용</b> 
							<textarea id="summernote" name="content" class="inp_02" cols="67" rows="25" scrollbars="no"></textarea>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<a href="javascript:writeArticle();">
						<img  src="${root}/img/board/btn_register.gif" width="42" height="21" border="0" name="register" value="" alt="등록">
					</a> 
					<a href="javascript:history.back();">
						<img src="${root}/img/board/b_cancel.gif" width="42" height="21" border="0" name="cencel" value="" alt="취소">
					</a>
				</div>
				
				
			</form>
		</div>
</body>
</html>