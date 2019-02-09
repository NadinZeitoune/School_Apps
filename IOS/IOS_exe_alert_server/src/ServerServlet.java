import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ServerServlet extends javax.servlet.http.HttpServlet {
    Map<String, String> users = new HashMap<>();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String responseToClient = "";

        switch (action){
            case "login":
                if (!users.containsKey(userName))
                    responseToClient = "UserName incorrect!";
                else {
                    if (!users.get(userName).equals(password)){
                        responseToClient =  "Password incorrect!";
                    }else {
                        responseToClient = "100";
                    }
                }
                break;
            case "signUp":
                if (users.containsKey(userName))
                    responseToClient = "Username already exist!";
                else {
                    users.put(userName, password);
                    responseToClient = "100";
                }
                break;
        }

        response.getWriter().write(responseToClient);
    }
}
