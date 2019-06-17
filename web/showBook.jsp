
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
        <h3 class="text-center p-3">Содержание книги</h3>
    <div class="p-3 d-flex flex-row justify-content-center">
        <div class="card" style="width: 28rem;">
            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-list">Название: ${book.name}</li>
              <li class="list-group-item bg-list">Автор: ${book.author}</li>
              <li class="list-group-item bg-list">Год издания: ${book.publishedYear}</li>
              <li class="list-group-item bg-list">Количество экземпляров свободно: ${book.count}</li>
            </ul>
          </div>
    </div>