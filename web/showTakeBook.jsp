
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="w-75 margin-container-center p-3 text-center">
        <h4 class="w-100  mb-5">Выдаем книгу</h4>
        <form action="createHistory" method="POST">
            <div class="w-100">
                <div class="form-group text-left">
                    <label for="_readerId">Список пользователей:</label>
                    <select class="form-control" name="readerId" id="_readerId">
                        <c:forEach var="reader" items="${listReaders}">
                            <option value="${reader.id}">${reader.name} ${reader.surname}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="form-group text-left">
                    <label for="_bookId">Список книг:</label>
                    <select class="form-control" name="bookId" id="_bookId">
                        <c:forEach var="book" items="${listBooks}">
                            <option value="${book.id}">${book.name} ${book.author}</option>
                        </c:forEach>
                    </select> <br>
                </div>
                <div class="text-center">
                    <input class="w-20 mt-2" type="submit" value="Выдать книгу">  
                </div>
            </div>
        </form>
    </div>