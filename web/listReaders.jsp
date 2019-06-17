
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h4 class="text-center">Список читателей:</h4>
        <hr>
        <table class="list-elements">
            <c:forEach var="reader" items="${listReaders}" varStatus="number">
                <tr class="p-3">
                    <td class="p-2">${number.index+1}. ${reader.name} ${reader.surname}</td>
                    <td class="p-3 text-right"><a href="showReader?readerId=${reader.id}">Посмотреть</a></td>
                </tr>
            </c:forEach>
                <tr class="p-3">
                    <td class="text-right"><hr>Всего читателей: </td>
                    <td class="text-center"><hr>${count}</td>
                </tr>
        </table>