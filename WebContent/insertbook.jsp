<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<form name="form1" method="post" enctype="multipart/form-data" action="insertbook.jsp">
<table>
<tr><td>Book Name:</td><td><input type="text" name="name" id="name" /></td></tr>
<tr><td>Book ID:</td><td><input type="text" name="id" id="id" /></td></tr>
<tr><td>Book Author:</td><td><input type="text" name="author" id="author" /></td></tr>
<tr><td>Book Category:</td><td><input type="text" name="category" id="category" /></td></tr>
<tr><td>Book Image:</td><td><input type="file" name="ImageFile" id="ImageFile" /></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="submit" />
</table>
</form>
<%Statement st=null;
Connection cn=null;
Class.forName("com.mysql.jdbc.Driver");
cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","password");
st=cn.createStatement();

try {
    String ImageFile="";
    String itemName = "";
    String bookName = "";
    String bookId = "";
    String bookAuthor = "";
    String bookCategory = "";
    String bookPath = "";
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        }
    else {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try {
            items = upload.parseRequest(request);
            }
        catch (FileUploadException e) {
            e.getMessage();
            }
        Iterator itr = items.iterator();
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            if (item.isFormField()) {
                String name = item.getFieldName();
                String value = item.getString();
                
                if(name.equals("ImageFile")) {
                    ImageFile=value;
                    }
                if(name.equals("name")) {
                    bookName = value;
                    } 
                if(name.equals("id")) {
                    bookId = value;
                    } 
                if(name.equals("author")) {
                    bookAuthor = value;
                }
                if(name.equals("category")) {
                    bookCategory = value;
                    }
                }
            else {
                try {
                    itemName = item.getName().substring(item.getName().lastIndexOf("\\")+1);
                    File savedFile = new File("C:\\Users\\sannamga\\workspace2\\OLMS\\WebContent\\images\\"+itemName);
                    bookPath ="images//"+itemName;
                    System.out.println(bookPath);
                    item.write(savedFile);
                    }
                catch (Exception e) {
                    out.println("Error"+e.getMessage());
                    }
                }
            }
        try {
        	if((bookCategory)!=""&&(bookId)!=""&&(bookName)!=""&&(bookAuthor)!=""&&(bookPath)!="")
        	{
          st.executeUpdate("insert into books_information(bookcategory, bookid, bookname, bookauthor, bookimagepath) values ('"+bookCategory+"','"+bookId+"','"+bookName+"','"+bookAuthor+"','"+bookPath+"')");    
        	}
        	else	out.println("fileds are missing");
        }
        catch(Exception el) {
            out.println("Inserting error"+el.getMessage());
            }
        }
    }
catch (Exception e){
    out.println(e.getMessage());
}
%>
</body>
</html>