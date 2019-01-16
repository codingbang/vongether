<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                    <h2 id="container">회원 수정하기</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <span>정보수정을 위해 아래 내용들을 작성해 주세요.</span>
            <span class="row" style="color: red;">*표시는 필수항목입니다.</span>
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <form id="editForm" class="form-horizontal">
                    <fieldset>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">아이디(email)</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <label class="control-label">${userInfo.mId}</label>
                                        </div>
                                        <input type="hidden" class="form-control" name="mId" value="${userInfo.mId}">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">비밀번호</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="password" class="form-control" id="pwd1" placeholder="비밀번호" required="true">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-10">
                                            <span>최소 6자리 이상 12자 이하 // 영어 소대문자숫자, 특수기호  2가지 조합</span>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">비밀번호 확인</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="password" class="form-control" id="pwd2" name="mPwd" placeholder="비밀번호 확인" required="true">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">성별</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <div class="radio col-lg-12">
	                                             <c:choose>
				                                    <c:when test="${userInfo.mGender == m}">
				                                        <label><input type="radio" checked disabled>남자</label>
	                                                    <label><input type="radio" disabled>여자</label>
				                                    </c:when>
				                                    <c:otherwise>
				                                       <label><input type="radio" disabled>남자</label>
	                                                    <label><input type="radio" checked disabled>여자</label>
				                                    </c:otherwise>
				                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">이름</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" value="${userInfo.mName}" name="mName" placeholder="이름" required="true" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">생년월일</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="mBirth" value="${userInfo.mBirth}" readonly required="true">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">우편번호</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" id="mPostcode" name="mPostcode" readonly value="${userInfo.mPostcode}" required="true">
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="button" class="btn btn-primary" id="searchPostBtn" value="주소찾기">
                                        </div>
                                        <div class="col-lg-5"></div>
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">기본주소</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="mAddr1" name="mAddr1" value="${userInfo.mAddr1}" placeholder="기본주소" readonly required="true">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">상세주소</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="mAddr2" name="mAddr2" value="${userInfo.mAddr2}" placeholder="상세주소" required="true" >
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">사진(프로필)</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control"  placeholder="임시로 넣은 text Box" readonly>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-4 col-lg-offset-9">
                                    <button class="btn btn-danger" type="reset">초기화</button>
                                    <input id="editBtn" type="button" class="btn btn-primary" value="수정하기">
                                    <button class="btn btn-info" onclick="back();">취소</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="myModal" class="modal" tabindex="-1" role="dialog" data-backdrop="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">주소찾기</h5>
            </div>
            <div class="modal-body">
                <div>
                    <h4>우편번호 검색</h4>
                    <form action="/search" id="postSearchForm" method="GET">
                        <fieldset>
                            <div>
                                <label>검색할 도로명/지번주소를 입력</label>
                                <div>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="query" name="query"
                                            style="width: 472px;"> <input type="hidden" id="currentPage"
                                            name="currentPage" value="">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="button" class="btn btn-success btn_search">검색</button>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>우편번호</th>
                                <th>주소</th>
                            </tr>
                        </thead>
                        <tbody id="postTbody">
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" >확인</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
          eventBinding();
          setDatepicker();
    }); //onload

    // 이벤트 바인딩 function
    function eventBinding() {
      // 주소찾기 버튼 
      $(document).on("click", "#searchPostBtn", function() {
        $('#myModal').modal('show');
      });
    
      // 주소검색 후 선택
      $(document).on("click", ".addressSelect", function() {
        var postcode = $(this).attr("id");
        var addr1 = $(this).attr("addr");
        $("#mPostcode").val(postcode);
        $("#mAddr1").val(addr1);
        $("#myModal").modal("hide");
      });
    
      //모달창에서의 주소 검색버튼 클릭이벤트
      $(".btn_search").click(function() {
        $('#currentPage').val("1");
        $.ajax({
          url: "postcodelist",
          data: $("#postSearchForm").serialize(),
          type: "POST",
          dataType: "json",
          success: function(data) {
            makePostList(data);
          }
        });
      });
    
      $(document).on("click", "#firstpage", function() {
        $('#currentPage').val("1");
        $.ajax({
          url: "postcodelist",
          data: $("#postSearchForm").serialize(),
          type: "POST",
          dataType: "json",
          success: function(data) {
            makePostList(data);
          }
        });
      });
    
      
      $(document).on("click", ".mvpage", function() {
        $('#currentPage').val($(this).attr("move-page-no"));
        $.ajax({
          url: "postcodelist",
          data: $("#postSearchForm").serialize(),
          type: "POST",
          dataType: "json",
          success: function(data) {
            makePostList(data);
          }
        });
    
      });
    
      // 아이디(이메일) 유효성 체크
      $("#mId").change(function() {
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var pass = mId.value.match(regExp);
        if (pass == null) {
          alert("제대로 입력하셈");
          $("#mId").val("");
          $("#mId").focus();
          // 입력값ㅂ 비우기
        } else{
          $("#id_check").text("아이디 중복 체크를 해주세요 ");
          $("#id_check").css("color", "blue");
        }
        
       });
    
    // 아이디(이메일) 중복 체크
      $("#checkId").click(function(){
       var mId = $("#mId").val();
       $.ajax({
        url: '/member/idCheck?mId=' + mId,
        type: 'get',
        success: function(data) {  
          if (data == 1) {
            $("#id_check").text("사용중 아이디입니다! ");
            $("#id_check").css("color", "red");
  
          } else {
            if(m_id = "") {
                $("#id_check").text("아이디를 입력해주세요! ");
                $("#id_check").css("color", "red");
              } else {
                $("#id_check").text("입력 가능한 아이디입니다! ");
                $("#id_check").css("color", "blue");
              }
            }
          }
  
        })
      });
      
      //비밀번호 조합  체크
      $("#pwd1").change(function() {
        // 최소 6자리 이상 12자 이하
        // 영어 소대문자숫자, 특수기호 2가지 조합
        var regExp = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{6,12}$/;
        var pass = pwd1.value.match(regExp);
        if (pass == null) {
          alert("제대로 입력하셈");
          $("#pwd1").val("");
          $("#pwd1").focus();
          
        }
      });
      
      // 비밀번호 확인값 일치체크 
      $("#pwd2").change(function(){
        if($('#pwd1').val()!=$('#pwd2').val()){
            $('font[name=check2]').text('');
            $('font[name=check2]').html("불일치");
            $("#pwd2").val("");
            alert("불일치");
        }else{
            $('font[name=check2]').text('');
            $('font[name=check2]').html("일치");
        }
      });
        
      // 이름 유효성체크
      $("#mName").change(function() {
        var regExp = /^[가-힣]{2,4}$/;
        var pass = mName.value.match(regExp);
        if (pass == null) {
          alert("이름은 한글 두글자 이상입니다. 제대로 입력해주세요");
          $("#mName").val("");
          $("#mName").focus();
          // 입력값ㅂ 비우기
        }
      });
    
        // 수정하기 버튼
        $("#editBtn").click(function() {
              $.fn.serializeObject = function()
              {
                 var o = {};
                 var a = this.serializeArray();
                 $.each(a, function() {
                     if (o[this.name]) {
                         if (!o[this.name].push) {
                             o[this.name] = [o[this.name]];
                         }
                         o[this.name].push(this.value || '');
                     } else {
                         o[this.name] = this.value || '';
                     }
                 });
                 return o;
              };
              // json 문자열로 form 내부의 값들을 추출
              var parameter = JSON.stringify($("#editForm").serializeObject());
              
              $.ajax({
                  url : '/member/edit.do',
                  type : 'POST',
                  contentType : 'application/json;charset=UTF-8',
                  dataType : 'json',
                  data : parameter,
                  success : function(data) {
                      if(data.isSuccess == 'true') {
                        alert("성공");
                        location.href = "/member/view.do";
                      } else{
                        alert("실패");
                        location.href = "redirect:/member/view.do";
                      }
                  }
              });
      });
      
    }
    
    //파싱한 우편목록 html생성
    function makePostList(data) {
      $("#postTbody").empty();
      var strHtml = '';
    
      if (data.errorCode != null && data.errorCode != "") {
        strHtml += '<tr>';
        strHtml += '    <td colspan="2">';
        strHtml += data.errorMessage;
        strHtml += '    </td>';
        strHtml += '</tr>';
      } else {
        var postlist = data.postlist;
        var length = postlist.length;
    
        for (var i = 0; i < length; i++) {
          strHtml += '<tr>';
          strHtml += '  <td>' + postlist[i].zipcode + '</td>';
          strHtml += '  <td><a id="'+ postlist[i].zipcode + '"class="addressSelect" addr="'+postlist[i].address+'">'
                  + postlist[i].address + '</a></td>';
          strHtml += '</tr>';
        }
    
        var totalCount = data.totalCount; //전체 데이터 개수
        var totalPage = data.totalPage; //전체 페이지 개수
        var countPerPage = data.countPerPage; //페이지당 몇개씩 10
        var currentPage = data.currentPage; //현재 페이지
        var startPage = data.startPage; //시작페이지
        var endPage = data.endPage; //끝페이지
    
        strHtml += '<tr align="center"><td colspan="2">';
        strHtml += '<nav>';
        strHtml += '    <ul class="pagination">';
    
        if (startPage > 1) {
          strHtml += '      <li><a class="mvpage" move-page-no="'+ 1 +'"><span>&laquo;</span></a></li>';
        }
    
        if (currentPage > 1) {
          strHtml += '      <li><a class="mvpage" move-page-no="'
                  + (currentPage - 1)
                  + '"><span>&lsaquo;</span></a></li>';
        }
    
        for (var j = startPage; j <= endPage; j++) {
    
          if (j == currentPage) {
            strHtml += '        <li class="active"><a class="mvpage" move-page-no="'+ j +'">'
                    + j
                    + '<span class="sr-only"></span></a></li>';
          } else {
            strHtml += '        <li><a class="mvpage" move-page-no="'+ j +'">'
                    + j
                    + '<span class="sr-only"></span></a></li>';
          }
        }
    
        if (currentPage < totalPage) {
          strHtml += '      <li><a class="mvpage" move-page-no="'
                  + (currentPage + 1)
                  + '"><span>&rsaquo;</span></a></li>';
        }
    
        if (endPage < totalPage) {
          strHtml += '      <li><a class="mvpage" move-page-no="'
                  + (totalPage)
                  + '"><span>&raquo;</span></a></li>';
        }
    
        strHtml += '    </ul>';
        strHtml += '</nav>';
        strHtml += '</td></tr>';
      }
    
      $("#postTbody").append(strHtml);
    }//end makePostList
    
    // 달력 설정 function
    function setDatepicker() {
      $("#mBirth").datepicker({
        dateFormat: "yy-mm-dd",
        maxDate   : 0,
        yearRange: "c-80:c",
        changeYear      : true,
        changeMonth     : true
      });
    }
    
    // 뒤로가기
    function back() {
       history.back();
    }
  
</script>
