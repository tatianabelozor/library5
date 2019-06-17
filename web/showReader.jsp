
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
        <h3 class="text-center p-3">Содержание книги</h3>
    <div class="p-3 d-flex flex-row justify-content-center">
        <div class="card" style="width: 28rem;">
            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-list">Имя: ${reader.name}</li>
              <li class="list-group-item bg-list">Фамилия: ${reader.surname}</li>
              <li class="list-group-item bg-list">Телефон: ${reader.phone}</li>
              <li class="list-group-item bg-list">Читатель читает книги: <br>
                  <ul>
                    <c:forEach var="history" items="${listHistories}">
                       <li class="list-group-item bg-list">${history.book.name}</li>
                    </c:forEach>
                  </ul>
              </li>
            </ul>
          </div>
    </div>