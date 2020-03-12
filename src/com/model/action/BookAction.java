package com.model.action;

import com.entity.Book;
import com.entity.User;
import com.model.service.BookService;
import com.model.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author:zhoufeng
 * @Date:2019/12/21
 */
@Controller//注解为控制器(Action)
@Scope("prototype")//注解作用范围
public class BookAction extends ActionSupport {
    @Resource
    private BookService bookService;
    @Resource
    private UserService userService;
    private Book book;
    private List<Book> books;
    private List<Book> recommendBooks;
    private Set brs;
    private int bookId;
    private int userId;

    public String retBook(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        User user = (User)session.get("user");
        Book b = bookService.getOneBookById(bookId);
        b.setBookNumber(b.getBookNumber()+1);
        bookService.retBook(user, b);
        return "success";
    }

    public String myBorrow(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        User user = (User)session.get("user");
        brs = bookService.myBorrow(user);
        return "success";
    }

    public String editOrAddBook(){
        book = bookService.getOneBookById(bookId);
        return "success";
    }

    public String save(){
        bookService.saveBook(book);
        return "success";
    }
    public String delete(){
        bookService.deleteBook(bookId);
        return "success";
    }

    public String borrow(){
        User user = userService.getOneUserById(userId);
        Book b = bookService.getOneBookById(bookId);
        if (user!=null&&b!=null&&b.getBookNumber()>0){
            b.setBookNumber(b.getBookNumber()-1);
            bookService.borrowBook(user, b);
            return "success";
        }else {
            return "input";
        }
    }

    public String getAllBooks(){
        books = bookService.getAllBooks();
        return "success";
    }

    public String getRecBooks(){
        recommendBooks = bookService.getAllBooks();
        return "success";
    }

    public String getOneBookById(){
        book = bookService.getOneBookById(bookId);
        return "success";
    }


    public List<Book> getRecommendBooks() {
        return recommendBooks;
    }

    public void setRecommendBooks(List<Book> recommendBooks) {
        this.recommendBooks = recommendBooks;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Set<Book> getBrs() {
        return brs;
    }

    public void setBrs(Set<Book> brs) {
        this.brs = brs;
    }
}
