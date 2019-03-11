import java.io.*;

public class ImageServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        //StringBuilder stringBuilder = new StringBuilder();
        byte[] buffer = new byte[2048];
        int actuallyRead;
        InputStream inputStream = request.getInputStream();
        File file = new File("/Users/hackeru/Desktop/nadin/pic.jpeg");
        OutputStream outputStream = new FileOutputStream(file);

        while ((actuallyRead = inputStream.read(buffer)) != -1){
            //stringBuilder.append(new String(buffer, 0, actuallyRead));
            outputStream.write(buffer, 0, actuallyRead);
        }
        outputStream.close();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    private void saveToFile(String data){
        File file = new File("/Users/hackeru/Desktop/nadin/pic.jpeg");
        OutputStream outputStream = null;

        try{
            outputStream = new FileOutputStream(file);
            outputStream.write(data.getBytes());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
