/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Book;
import entity.History;
import entity.Reader;
import entity.User;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.BookFacade;
import session.HistoryFacade;
import session.ReaderFacade;

/**
 *
 * @author user
 */
@WebServlet(name = "WebController", urlPatterns = {
    "/showAddBook",
    "/createBook",
    "/listBooks",
    "/listReaders",
    "/showTakeBook",
    "/createHistory",
    "/showReturnBook",
    "/returnBook",
    "/showBook",
    "/showReader",
    
    
    
})
public class WebController extends HttpServlet {
@EJB BookFacade bookFacade;
@EJB ReaderFacade readerFacade;
@EJB HistoryFacade historyFacade;
   
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Calendar c = new GregorianCalendar();
        String path = request.getServletPath();
        
        HttpSession session = request.getSession(false);
        if(session == null){
            request.getRequestDispatcher("/showLogin.jsp")
                        .forward(request, response);
                return;
        }
        User enteredUser =  (User) session.getAttribute("enteredUser");
        if(enteredUser == null){
            request.getRequestDispatcher("/showLogin.jsp")
                        .forward(request, response);
                return;
        }
        
        switch (path) {
            case "/showAddBook":
                request.getRequestDispatcher("/showAddBook.jsp")
                        .forward(request, response);
                break;
            case "/createBook":
                String name=request.getParameter("name");
                String author = request.getParameter("author");
                String isbn = request.getParameter("isbn");
                String publishedYear = request.getParameter("publishedYear");
                String quantity = request.getParameter("quantity");
                Book book = new Book(
                        name, 
                        author, 
                        isbn, 
                        new Integer(publishedYear),
                        new Integer(quantity), 
                        new Integer(quantity)
                );
                bookFacade.create(book);
                request.getRequestDispatcher("/index.jsp")
                        .forward(request, response);
                break;
            case "/listBooks":
                List<Book> listBooks = bookFacade.findAll();
                request.setAttribute("listBooks", listBooks);
                request.setAttribute("count",listBooks.size());
                request.getRequestDispatcher("/listBooks.jsp")
                        .forward(request, response);
                break;
            case "/showBook":
                String bookId = request.getParameter("bookId");
                book = bookFacade.find(new Long(bookId));
                request.setAttribute("book", book);
                
                request.getRequestDispatcher("/showBook.jsp")
                        .forward(request, response);
                break;
            
                
            case "/listReaders":
                List<Reader> listReaders = readerFacade.findAll();
                request.setAttribute("listReaders", listReaders);
                request.setAttribute("count",listReaders.size());
                request.getRequestDispatcher("/listReaders.jsp")
                        .forward(request, response);
                break; 
            case "/showReader":
                String readerId = request.getParameter("readerId");
                Reader reader = readerFacade.find(new Long(readerId));
                request.setAttribute("reader", reader);
                List<History> listHistories = historyFacade.findNotReturnBooks(reader);
                request.setAttribute("listHistories", listHistories);
                request.getRequestDispatcher("/showReader.jsp")
                        .forward(request, response);
                break;
                
            case "/showTakeBook":
                listReaders = readerFacade.findAll();
                request.setAttribute("listReaders", listReaders);
                listBooks = bookFacade.findAll();
                request.setAttribute("listBooks", listBooks);
                request.getRequestDispatcher("/showTakeBook.jsp")
                        .forward(request, response);
                break;
            case "/createHistory":
                readerId = request.getParameter("readerId");
                bookId = request.getParameter("bookId");
                reader = readerFacade.find(new Long(readerId));
                book = bookFacade.find(Long.parseLong(bookId));
                if(book.getCount() > 0){
                    book.setCount(book.getCount()-1);
                    bookFacade.edit(book);
                    History history = new History(reader, book, c.getTime(), null);
                    historyFacade.create(history);
                    request.setAttribute("info", "Книга выдана");
                }else{
                    request.setAttribute("info", "Книга не выдана. Все книни читаются");
                }
                request.getRequestDispatcher("/index.jsp")
                        .forward(request, response);
                break;
            case "/showReturnBook":
                listHistories = historyFacade.findNotReturnBooks();
                request.setAttribute("listHistories", listHistories);
                request.getRequestDispatcher("/showReturnBook.jsp")
                        .forward(request, response);
                break;
            case "/returnBook":
                String historyId = request.getParameter("historyId");
                History history = historyFacade.find(new Long(historyId));
                book = history.getBook();
                book.setCount(book.getCount()+1);
                bookFacade.edit(book);
                c = new GregorianCalendar();
                history.setDateReturnBook(c.getTime());
                historyFacade.edit(history);
                request.getRequestDispatcher("/showReturnBook")
                        .forward(request, response);
                break;
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
