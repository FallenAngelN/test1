<%@ page import="com.example.storehouse.*" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10, 10, 10);
    String registerMessage = null;
    boolean isDouble = false;
    if (request.getParameter("register-button") != null) {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        for (Account account: Database.accountList){
            if (account.getLogin().equals(login)) {
                registerMessage = "Аккаунт с таким логином уже существует";
                isDouble = true;
                break;
            }
        }
        if (!isDouble){
            Geologist geolog = new Geologist(name, address, phone, email);
            Admin.addAccount(login, password, geolog);
            response.sendRedirect("authorization.jsp");
        }
    }
    Cookie[] cookies = request.getCookies();
    String cookieName = "status";
    Cookie cookie = null;
    if(cookies != null) {
        for(Cookie c: cookies) {
            if(cookieName.equals(c.getName())) {
                cookie = c;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel='stylesheet' type='text/css' href='style/style.css' />
</head>
<body>
<header>
    <img class="logo" src="images/temp.png" alt="logo pic">
    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="minerals.jsp">Минералы</a></li>
            <li><a href="samples.jsp">Образцы</a></li>
            <li><a href="expeditions.jsp">Экспедиции</a></li>
            <%if (cookie != null && cookie.getValue().equals("admin")){
				%>
			<li><a href="geologs.jsp">Геологи</a></li>
			<%}%>
            <% if (cookie != null){%>
            <%="<li style=\"color: aquamarine\">User: "+cookie.getValue()+"</li>"%>
            <%}%>
        </ul>
    </nav>
    <a class="cta" href="authorization.jsp"><button>Войти</button></a>
</header>
<main>
    <div class="main-area">
        <div class="login-area">
            <form action="" method="post">
                Логин: <input style="width: 192px;" class="input-background" required type="text" name="login"><br>
                Пароль: <input class="input-background" required type="password" name="password"><br>
                ФИО: <input style="width: 205px;" class="input-background" required type="text" name="name"><br>
                Адрес: <input style="width: 185px;" class="input-background" required type="text" name="address"><br>
                Телефон: <input required class="input-background" type="tel" placeholder="+7(###)-###-##-##"
                                    pattern="\+7\([0-9]{3}\)[0-9]{3}\-[0-9]{2}\-[0-9]{2}" name="phone"><br/>
                Email: <input style="width: 192px;" class="input-background" required type="text" name="email"><br>
                <input style="width: 150px; margin-left: 17%; text-align: center" class="input-background" type="submit" name="register-button" value="Зарегистрироваться">
            </form>
            <p><%if(registerMessage != null)%><%=registerMessage%></p>
        </div>
    </div>
</main>
</body>
</html>