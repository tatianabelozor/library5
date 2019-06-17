
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="w-100 p-3 text-center">
        <h1>Новый чититель</h1>
        <hr>
        <form action="createReader" method="POST">
            Имя читателя:<br>
            <input class="w-50" type="text" name="name"><br>
            Фамилия читателя:<br>
            <input class="w-50" type="text" name="surname"><br>
            Телефон:<br>
            <input class="w-50" type="text" name="phone"><br>
            Логин:<br>
            <input class="w-50" type="text" name="login"><br>
            Пароль:<br>
            <input class="w-50" type="password" name="password"><br>
            
            <input type="submit" value="Добавить" class="mt-3 w-50 btn btn-light border">
        </form>      
    </div>
   
