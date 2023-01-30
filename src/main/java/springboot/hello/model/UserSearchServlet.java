package springboot.hello.model;

import com.fasterxml.jackson.core.TreeNode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UserSearchServlet", value = "/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");
        response.getWriter().write(getJSON(userName));
    }
    public String getJSON(String userName) {
        if(userName == null) userName = "";
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.search(userName);
        for(int i = 0; i< userList.size(); i++) {
            result.append("[{\"value\": \"" + userList.get(i).getName() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getAge() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getGender() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getAddress() + "\"}],");
        }
        result.append("]}");
        return result.toString();
    }
}
