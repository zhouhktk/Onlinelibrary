package com.entity;

import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * @Author:zhoufeng
 * @Date:2019/12/16
 */
@Entity
@Table(name = "user", catalog = "bigwork")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    private int admin;

    @ManyToMany(targetEntity = Book.class, fetch = FetchType.EAGER, mappedBy = "users", cascade = CascadeType.ALL)
    private Set<Book> books = new HashSet<>();

    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }
}
