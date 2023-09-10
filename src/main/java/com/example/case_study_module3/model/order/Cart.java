package com.example.case_study_module3.model.order;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Item> items;


    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }
    public Item getItemById(int id){
        for (Item item:items) {
            if (item.getProduct().getProductId() == id){
                return item;
            }
        }
        return null;
    }
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    //Thêm vào giỏ
    public void addItem(Item item){
        // có ở trong giỏ rồi
        if (getItemById(item.getProduct().getProductId()) != null){
            Item item1 =getItemById(item.getProduct().getProductId());
            item1.setQuantity(item.getQuantity() + item1.getQuantity());
        }else {
            items.add(item);
        }
    }
    public void removeItem(int id){
        if (getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    public int getTotalMoney(){
        int total = 0;
        for (Item item : items) {
            total += item.getPrice() * item.getQuantity();

        }
        return total;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
}
