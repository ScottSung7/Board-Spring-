<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.user.UserDTO" %>
<%@ page import = "com.user.UserDAO" %>
<%@ page import = "com.service.UserService" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JSP Ajax 실시간 회원제 채팅 서비스</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>	
			<a class="navbar-brand" href="index">실시간 회원제 채팅 서비스</a>	
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a>
				<li class="active"><a href="boardView">자유게시판</a>
			</ul>
			<%
			String userID = null;
			UserDTO user = (UserDTO)session.getAttribute("login");
			if(session.getAttribute("userID") !=null){
				userID = (String)session.getAttribute("userID");
				
			
			}
			if(userID == null) {
				session.setAttribute("messageType", "오류메시지");
				session.setAttribute("messageContent", "로그인이 필요합니다");
				response.sendRedirect("index.jsp");
				return;
			}
		/*	UserDTO user = new UserDTO();
			System.out.println("Update ID"+userID);
		 	UserService service = new UserService();
			user = service.getUser(userID);
			System.out.println("updateeeeeee"+user.getUserGender()); */
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span>
					<ul class="dropdown-menu">
						<li><a href="login">로그인</a></li>
						<li><a href="join">회원가입</a></li>
						<li><a href="update">회원정보 수정</a></li>
					</ul>	
					</a>
				</li>			
			</ul>
			
		</div>
	</nav>
	<div class="container">
		<form method="post" action="./userUpdate">
			<table class="table table-boardered table-hober" style="text-align: center; border: 1-x solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원정보 수정 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><%= user.getUserID() %>
						<input type="hidden" name="userID" value="<%= user.getUserID() %>"></td>											
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword1" type="password"  name="userPassword" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5>
						<td colspan="2"><input class="form-control" id="userName" type="text"  name="userName" maxlength="20" placeholder="이름을 입력하세요." value="<%= user.getUserName() %>"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>나이</h5>
						<td colspan="2"><input class="form-control" id="userAge" type="number"  name="userAge" maxlength="20" placeholder="나이를 입력하세요." value="<%= user.getUserAge() %>"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>성별</h5>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
								
										<input type="radio" name="userGender" autocomplete="off" value="남자" <%if(user.getUserGender().equals("남자")) out.print("checked"); %>>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자" <%if(user.getUserGender().equals("여자")) out.print("checked"); %>>여자
									</label>
								</div>
							</div>								
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5>
						<td colspan="2"><input class="form-control" id="userEmail" type="email"  name="userEmail" maxlength="20" placeholder="이메일을 입력하세요." value="<% user.getUserEmail(); %>"></td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="3"><input class="btn btn-primary pull-right" type="submit" value="수정"></td>
					</tr>
				</tbody>
			
			</table>
		
		</form>
	
	</div>
	
	
</body>
</html>