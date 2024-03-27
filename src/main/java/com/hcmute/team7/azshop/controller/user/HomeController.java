package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IProductService;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    @Inject
    private IProductService productService;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        // Lấy số lượng sản phẩm trong giỏ hàng
        if (user != null) {
            Cart cart = user.getCart();
            Set<CartItem> cartItems = user.getCart().getCartItems();

            session.setAttribute("totalItemInCart", cart.getTotalItem());
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cart", user.getCart());
        } else {
            session.setAttribute("totalItemInCart", 0);
        }


        // Load tất cả sản phẩm từ cơ sở dữ liệu
        List<Product> allProducts = productService.findAll();

        // Lọc danh sách sản phẩm có percentDiscount > 0
        List<Product> products = new ArrayList<>();
        for (Product product : allProducts) {
            if (product.getPercentDiscount() > 0) {
                products.add(product);
            }
        }

        // Lọc danh sách sản phẩm có sold > 0 và sắp xếp theo sold giảm dần
        List<Product> selling = allProducts.stream()
                .filter(productSelling -> productSelling.getPercentDiscount() > 0)
                .sorted(Comparator.comparingInt(Product::getSold).reversed())
                .collect(Collectors.toList());

        request.setAttribute("selling", selling);

        request.setAttribute("products", products);


        request.getRequestDispatcher("/views/user/index.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void home(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        // Lấy số lượng sản phẩm trong giỏ hàng
        if (user != null) {
            Cart cart = user.getCart();
            Set<CartItem> cartItems = user.getCart().getCartItems();

            session.setAttribute("totalItemInCart", cart.getTotalItem());
            request.setAttribute("cartItems", cartItems);
        } else {
            session.setAttribute("totalItemInCart", 0);
        }

        // Load tất cả sản phẩm từ cơ sở dữ liệu
        List<Product> allProducts = productService.findAll();

        // Lọc danh sách sản phẩm có percentDiscount > 0
        List<Product> products = new ArrayList<>();
        for (Product product : allProducts) {
            if (product.getPercentDiscount() > 0) {
                products.add(product);
            }
        }

        // Lọc danh sách sản phẩm có percentDiscount > 0 và sắp xếp theo sold giảm dần
        List<Product> selling = allProducts.stream()
                .filter(productSelling -> productSelling.getPercentDiscount() > 0)
                .sorted(Comparator.comparingInt(Product::getSold).reversed())
                .collect(Collectors.toList());


        request.setAttribute("selling", selling);
        request.getRequestDispatcher("/views/user/index.jsp").forward(request, response);

        request.setAttribute("products", products);
        request.getRequestDispatcher("/views/user/index.jsp").forward(request, response);
    }
}