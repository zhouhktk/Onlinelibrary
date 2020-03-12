package com.model.service;

import com.entity.Book;
import com.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * @Author:zhoufeng
 * @Date:2019/12/21
 */
@Service
public class BookService {
    @Resource //注入会话工厂
    private SessionFactory sf;

    public void borrowBook(User user, Book book){
        Session session = sf.openSession();
        Transaction transaction = session.beginTransaction();
        Set<User> users = book.getUsers();
        users.add(user);
        book.setUsers(users);
        session.update(book);
        transaction.commit();
        session.close();
    }
    public void retBook(User user, Book book){
        Session session = sf.openSession();
        Transaction transaction = session.beginTransaction();
        Set<User> users = book.getUsers();
        for (User u:users){
            if (u.getId()==user.getId()){
                users.remove(u);
                break;
            }
        }
        book.setUsers(users);
        session.update(book);
        transaction.commit();
        session.close();
    }

    public Set myBorrow(User user){
        Session session = sf.openSession();
        Set<Book> books = user.getBooks();
        System.out.println("myBorrow"+user.getUsername());
        for (Book b:books){
            System.out.println("b:"+b.getBookName());
        }
        session.close();
        return books;
    }

    public void saveBook(Book book) {
        Session session = sf.openSession();
        Transaction transaction = session.beginTransaction();
        if (getOneBookById(book.getId()) != null) {
            session.update(book);
        } else {
            session.save(book);
        }
        transaction.commit();
        session.close();
    }

    public void deleteBook(int id){
        Session session = sf.openSession();
        Transaction transaction = session.beginTransaction();
        Book book1 = session.get(Book.class, id);
        session.delete(book1);
        transaction.commit();
        session.close();
    }

    public Book getOneBookById(int id) {
        Session session = sf.openSession();
        Book book = session.get(Book.class, id);
        session.close();
        if (book != null) {
            return book;
        } else
            return null;
    }

    public List<Book> getAllBooks() {
        Session session = sf.openSession();
        Query from_book = session.createQuery("from Book");
        List<Book> list = from_book.list();
        session.close();
        return list;
    }
}
