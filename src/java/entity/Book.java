/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author laptop368
 */
public class Book {
    private String name;
    private int id;
    private int quantity;
    private int price;
    private String author;
    private String image;
    private String language;
    private String category;
    private String publisher;
    private String description;
    private int num_of_page;
    private int discount;

    private Author authors;
    private Category categories;
    
    public Book() {
    }

    public Book(String name, int id, int quantity, int price, String author, String image, String language, String category, String publisher, String description, int num_of_page, int discount) {
        this.name = name;
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.author = author;
        this.image = image;
        this.language = language;
        this.category = category;
        this.publisher = publisher;
        this.description = description;
        this.num_of_page = num_of_page;
        this.discount = discount;
    }

    public Book(String name, int id, int quantity, int price, String author, String image, String language, String category, String publisher, String description, int num_of_page, int discount, Author authors, Category categories) {
        this.name = name;
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.author = author;
        this.image = image;
        this.language = language;
        this.category = category;
        this.publisher = publisher;
        this.description = description;
        this.num_of_page = num_of_page;
        this.discount = discount;
        this.authors = authors;
        this.categories = categories;
    }

    public void setAuthors(Author authors) {
        this.authors = authors;
    }

    public void setCategories(Category categories) {
        this.categories = categories;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNum_of_page() {
        return num_of_page;
    }

    public void setNum_of_page(int num_of_page) {
        this.num_of_page = num_of_page;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    public String getPriceAfterDiscount() {
        double productPrice = price*(1-discount*0.01);
        String formattedPrice = String.format("%,.0f", productPrice);
        formattedPrice = formattedPrice.replace(",", ".");
        return formattedPrice;
    }
    @Override
    public String toString() {
        return "Book{" + "name=" + name + ", id=" + id + ", quantity=" + quantity + ", price=" + price + ", author=" + author + ", image=" + image + ", language=" + language + ", category=" + category + ", publisher=" + publisher + ", description=" + description + ", num_of_page=" + num_of_page + ", discount=" + discount + '}';
    }

    
}