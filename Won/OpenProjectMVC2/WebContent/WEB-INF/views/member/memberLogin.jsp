<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<meta charset="utf-8">


	<%
		if (session.getAttribute("uid") == null) { //세션이 설정되지 않을 경우
	
	%>
	<form method="post" action="memberLoginSuccess.do"> 
	<table>
	<tr>
	<td><label for="uid">아이디</label></td>
	<td><input type="text" name="uid" id="uid" placeholder="아이디" required></td>
	</tr>
	<tr>
	<td><label for="upw">비밀번호</label></td>
	<td><input type="password" name="upw" id="upw" placeholder="비밀번호" required></td>
	</tr>
	<tr>
	<td></td>
	<td><input type="submit" value="로그인"><input type="reset" value="초기화"></td>
	</tr>
	
	</table>
	</form>
	<script type="text/javascript">
        // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
        // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
        Kakao.init('99700abe71de0064c0d0c5702931b834');
        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
                success: function(authObj) {
                    alert(JSON.stringify(authObj));

                    //Kakao.Auth.setAccessToken(authObj.access_token);

                    startWithKakao();


                },
                fail: function(err) {
                    alert(JSON.stringify(err));
                }
            });
        };
        function startWithKakao() {
            Kakao.Auth.getStatusInfo(function(statusObj) {
                if (statusObj.status == 'connected') {
                    console.log('connection OK');
                } else {
                    $('#custom-login-btn').css('display', 'inline');
                }
            });
        };
       </script>
		
		
	</form>
	<%
		} else {
	%>
	<form method="post" action="logout.jsp">
		<%=session.getAttribute("uid")%>님 환영합니다~
		<input type="submit" value="로그아웃">
	</form>
	<%
		}
	%>

	

