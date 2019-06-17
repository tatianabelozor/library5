
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="w-100 p-3 text-center">
        <h4>Создать книгу</h4>
        <hr>
        <form action="createBook" method="POST">
            Название книги:<br>
            <input class="w-50" type="text" name="name"><br>
            Автор книги:<br>
            <input class="w-50" type="text" name="author"><br>
            Год издания книги:<br>
            <input class="w-50" type="text" name="publishedYear"><br>
            ISBN книги:<br>
            <input class="w-50" type="text" name="isbn"><br>
            Количество книг:<br>
            <input class="w-50" type="text" name="quantity"><br>
            <input type="submit" value="Создать" class="mt-3 w-50 btn btn-light border">
        </form>        
    </div>
