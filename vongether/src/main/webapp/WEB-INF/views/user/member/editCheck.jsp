<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.login-header{
    position: relative;
    top: 50%;
    margin-top: 130px;
}

</style>
<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="login-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>개인 정보 수정</h2>
                </div>
                <div class="col-lg-3"></div>
                <div class="row">
	            <span>회원님의 정보를 안전하게 보호하기 위해 <b>비밀번호</b>를 다시 한번 확인합니다.</span>
	            <span>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</span>
        </div>
            </div>
        </div>
        
        <div class="row">
            <div class="login-body col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form class="form-signin" action="login.do" method="post">
                        <fieldset>
                        <ul>
                            <li></li>
                            <li></li>
                            
                        </ul>
                            <div class="row">
                                <span>아이디 : "${userInfo.mId}"</span>
                                <span>  </span>
                            </div>
                        
                            <div class="row">
                                
                                <span>비밀번호 : </span>
                                <input type="password" class="form-control" name="mPwd" id="inputPassword" placeholder="비밀번호" required="true">
                            </div>
                        
                            <div class="row form-group">
                                <button class="btn btn-large btn-warning form-control active" type="submit"><span>확인</span></button>
                            </div>
                            
                        </fieldset>
                    </form>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
        
        
    </div>
</div>
    

  
