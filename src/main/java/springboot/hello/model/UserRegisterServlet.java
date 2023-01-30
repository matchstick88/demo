package springboot.hello.model;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserRegisterServlet", value = "/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userGender = request.getParameter("userGender");
        String userAddress = request.getParameter("userAddress");
        response.getWriter().write(register(userName, userAge, userGender, userAddress)+"");
    }

    public int register(String userName, String userAge, String userGender, String userAddress) {
        User user = new User();
        try {
            user.setName(userName);
            user.setAge(Integer.parseInt(userAge));
            user.setGender(userGender);
            user.setAddress(userAddress);
        } catch(Exception e) {
            return 0;
        }
        return new UserDAO().register(user);
    }
}
