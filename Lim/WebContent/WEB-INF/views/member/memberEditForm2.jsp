<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<meta charset="UTF-8">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
.check_ok {
	color: blue;
}

.check_not {
	color: red;
}

#idchk {
	display: none;
}
</style>





	<div>
		<h1 class="subtitle">회원 수정</h1>
		<hr>
		<!-- 이 페이지는 데이터 베이스에 저장된 데이터를 value 값에 세팅해야합니다. -->
		<form id="editForm" action="memberEdit.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${member.idx}">
			<table>
				<tr>
					<td>아이디(email)</td>
					<td><input type="email" name="userId" id="uid"
						value="${member.userId}" readonly>아이디는 수정이 불가합니다.</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName"
						value="${member.userName}" required></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="userNickname" required value=""></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" required value=""></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="contactNumber" required value=""></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="sample6_postcode"
						placeholder="우편번호"> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>

						<input type="text" id="sample6_address" placeholder="주소"
						name="address" value=""><br> <input
						type="text" id="sample6_detailAddress" placeholder="상세주소"
						name="addr2" value=""> <input type="text"
						id="sample6_extraAddress" placeholder="참고항목" name="addr3"
						value=""></td>
				</tr>
				<tr>
					<td>사진 </td>
					<td><input type="file" name="photo">
					현재파일 : ${member.photo}
					<td><input type="hidden" name="oldFile" value="${member.photo}"></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" name="회원가입"> <input
						type="reset"></td>
				</tr>
			</table>
		</form>
	</div>

<script>

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	$(document).ready(function() {

	});
</script>









