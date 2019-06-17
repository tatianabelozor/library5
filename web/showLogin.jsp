<%-- 
    Document   : showLogin
    Created on : Jun 10, 2019, 9:07:17 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div class="margin-container-center w-50">
        <h1>Вход в систему</h1>
        <form action="login" method="POST">
          <div class="form-group">
            <label for="login">Логин: </label>
            <input type="text" class="form-control" name="login" id="login" placeholder="Введите логин">
          </div>
          <div class="form-group">
            <label for="password">Пароль: </label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Пароль">
          </div>

          <button type="submit" class="btn btn-primary">Войти</button>
          <br><br>
          <a  href="showAddReader">Зарегистрироваться</a><br>
        </form>
    </div>
