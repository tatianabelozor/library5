
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h4 class="text-center">В нашей библиотеке имеются следующие книги:</h4>
        <hr>
        <table class="list-elements">
            <c:forEach var="book" items="${listBooks}" varStatus="number">
                <tr class="p-3">
                    <td class="p-2">${number.index+1}. "${book.name}". ${book.author} </td>
                    <td class="p-2 text-right"><a href="showBook?bookId=${book.id}">Посмотреть</a></td>
                </tr>
            </c:forEach>
                <tr >
                    <td class="text-right"><hr>Всего книг: </td>
                    <td class="text-center"><hr>${count}</td>
                </tr>
        </table>