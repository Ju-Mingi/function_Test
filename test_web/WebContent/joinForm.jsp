<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IWPERSON 회원가입</title>
<link rel="stylesheet" href="join.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="join.js"></script>
</head>
<body>
	<div class="container">
		<form class="login-form" action="joinProcess.jsp" method="post">
			<div class="form_title" id="form_title">회원가입</div>
			<table id="table">
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" size="30" maxlength="16">
						<input type="button" value="중복확인" onclick="test_id()"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" size="30" name="pw" maxlength="20"></td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" size="30" name="pw_check"
						maxlength="20"> <!-- 비밀번호와 비밀번호 확인이 일치하지 않으면 경고문이 출력되고 맞게 입력했으면 경고문이 사라지거나
                        일치합니다 라는 문구가 출력되게 해야한다. --></td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" size="10" maxlength="10"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남">남
						&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" value="여">여</td>
				</tr>

				<tr>
					<td id="title">생년월일</td>
					<td><input type="text" name="birth_yy" maxlength="4"
						placeholder="연도(4자리)" size="4"> <!-- 4자리를 입력하지 않으면 박스 오른쪽에 경고문이 출력되게 해야한다. -->
						<select id="birth" class="selectbox" name="birth_mm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <input id="birth" type="text" name="birth_dd" size="1"
						maxlength="2" placeholder="일" size="2"></td>
				</tr>

				<tr>
					<td id="title">이메일</td>
					<td><input id="email" type="text" name="email_1"
						maxlength="30">&nbsp;@&nbsp; <select class="selectbox"
						name="email_2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
					</select></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input id="phone" type="text" size="3" name="phone_1"
						placeholder="010" /> <input id="phone" type="text" size="4"
						name="phone_2" placeholder="1234" /> <input id="phone"
						type="text" size="4" name="phone_3" placeholder="5678" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input id="address" type="text" size="50" name="address_street" />

						<input id="address_detail" type="text" size="50" name="address_detail"
						placeholder="상세주소" /></td>
				</tr>
				<tr>
					<td id="title">회원정보 찾기 문답</td>
					<td><select id="question" name="question">
							<option value="">문제 선택</option>
							<option value="01">나의 보물 1호는?</option>
							<option value="02">가장 기억에 남는 선생님 성함은?</option>
							<option value="03">태어난 곳은?</option>
							<option value="04">가장 좋아하는 스포츠 팀은?</option>
							<option value="05">가장 기억에 남는 날짜는?</option>
							<option value="06">성인이 되고 나서 가장 먼저 취득한 자격증은?</option>
							<option value="07">자신의 장래희망은?</option>
					</select> <input id="answer" type="text" name="answer" maxlength="100"
						placeholder="답변"></td>
				</tr>

			</table>

			<label for="chkEntCus"> <input type="checkbox" id="chkEntCus" />
				<font size="4" color="black"><strong> 사업자(기업)
						회원이십니까?</strong></font>
			</label><br> <br>

			<div id="entTable">
				<div class="form_title" id="form_title">사업자 정보 입력</div>
				<table id="table">
					<tr>
						<td id="title">대표명</td>
						<td><input type="text" name="enter_name" size="30"
							maxlength="20"></td>
					</tr>

					<tr>
						<td id="title">사업자 등록번호</td>
						<td><input id="ent_num_1" type="text" name="enter_num_1"
							maxlength="3" placeholder="청(서)(3)"> <input
							id="ent_num_2" type="text" name="enter_num_2" maxlength="2"
							placeholder="개인(법인)(2)"> <input id="ent_num_3"
							type="text" name="enter_num_3" maxlength="4"
							placeholder="일련번호(4)"> <input id="ent_num_4" type="text"
							name="enter_num_4" maxlength="1" placeholder="검증(1)"></td>
					</tr>

					<tr>
						<td id="title">사업장 전화번호</td>
						<td><input id="ent_phone_first" type="text" size="2"
							name="ent_phone_1" placeholder="010" /> <input id="ent_phone"
							type="text" size="4" name="ent_phone_2" placeholder="1234" /> <input
							id="ent_phone" type="text" size="4" name="ent_phone_3"
							placeholder="5678" /></td>
					</tr>

					<tr>
						<td id="title">사업장 주소</td>
						<td><input id="ent_address" type="text" size="50"
							name="ent_Address" /> <input id="ent_address_detail" type="text"
							name="entAddress" size="50" placeholder="상세주소"></td>
					</tr>
				</table>
			</div>
			<input id = "signup_button" type="submit" value="회원가입">
		</form>
	</div>
	<br>
	<br>
</body>
</html>