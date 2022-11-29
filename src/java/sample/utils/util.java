/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import sample.dto.CartItems;

/**
 *
 * @author Minh Huy
 */
public class util {

    public static int getTotal(HashMap<String, CartItems> cart) {
        Collection<CartItems> values = cart.values();
        int sum = 0;
        for (CartItems value : values) {
            sum += value.getPrice() * value.getQuantity();
        }
        return sum;
    }

    public static void main(String[] args) {
        HashMap<String, CartItems> cart = new HashMap<>();
        CartItems cartItems = new CartItems(1, "", 200000, "", "", 1, 1, "", 2);
        cart.put("1", cartItems);
        CartItems cartItems2 = new CartItems(1, "", 100000, "", "", 1, 1, "", 1);
        cart.put("2", cartItems2);
        CartItems cartItems3 = new CartItems(1, "", 100000, "", "", 1, 1, "", 1);
        cart.put("3", cartItems3);
        getTotal(cart);
    }

}
