
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <div class="w-100 p-3 text-center">
        <form action="returnBook" method="POST">
            <h1>Список выданных книг:</h1>
            <p>${info}</p>
            <select name="historyId">
                <c:forEach var="history" items="${listHistories}">
                    <option value="${history.id}">
                        ${history.reader.name} ${history.reader.surname}
                        читает книгу: "${history.book.name}"
                    </option>
                </c:forEach>
            </select>
            <input type="submit" value="Вернуть книгу">
        </form>
     </div>
    
