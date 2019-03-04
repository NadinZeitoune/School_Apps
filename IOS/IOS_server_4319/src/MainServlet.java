import java.io.IOException;
import java.io.InputStream;

public class MainServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        StringBuilder stringBuilder = new StringBuilder();
        byte[] buffer = new byte[2048];
        int actuallyRead;
        InputStream inputStream = request.getInputStream();

        while ((actuallyRead = inputStream.read(buffer)) != -1){
            stringBuilder.append(new String(buffer, 0, actuallyRead));
        }

        System.out.println(stringBuilder.toString());
        response.getOutputStream().write("thank you client".getBytes());
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.getWriter().write("hello client!");
    }
}