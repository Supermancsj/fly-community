package org.zdk.fly_community.util;

import lombok.extern.slf4j.Slf4j;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Slf4j
public class FileUploadUtil {

    public static ResponseEntity fileUpload(HttpServletRequest request){
        String saveFileName = ""; //文件名称
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if(isMultipart){
                //创建工厂（这里用的是工厂模式）
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //从ServletContext中得到上传来的数据
                ServletContext servletContext = request.getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                //用于解析resquest，能从resquest中解析出装有FileItem对象的一个List
                ServletFileUpload upload = new ServletFileUpload(factory);
                //每个FileItem的实例都包含一个文件以及该文件的其他一些属性（文件名、大小等）
                List<FileItem> items = upload.parseRequest(request);
                //指定存储发帖信息中的图片
                File realPath = new File(servletContext.getRealPath("imgs/sendPost"));
                if(!realPath.exists()){
                    realPath.mkdirs();
                }
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    String suffixName = item.getName().substring(item.getName().lastIndexOf("."));
                    saveFileName = LocalDate.now().format(DateTimeFormatter.ISO_DATE)+"-"+ UUID.randomUUID() + suffixName;
                    File saveFile = new File(realPath, saveFileName);
                    item.write(saveFile);
                    //log.info("发帖界面，文件已上传：{}",saveFile.getPath());
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
            return ResponseEntity.fail("图片上传失败~");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //返回数据格式
        /*{
            "code": 0 //0表示成功，其它失败
            ,"msg": "" //提示信息 //一般上传失败后返回
            ,"data": {
                "src": "图片路径"
                 ,"title": "图片名称" //可选
            }
        }*/
        Map<String,String> data = new HashMap<>();
        System.out.println(saveFileName);
        data.put("src","imgs/sendPost/"+saveFileName);
        data.put("title",saveFileName);
        return ResponseEntity.ok(data);
    }
    public static ResponseEntity postfileUpload(HttpServletRequest request){
        String saveFileName = ""; //文件名称
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if(isMultipart){
                //创建工厂（这里用的是工厂模式）
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //从ServletContext中得到上传来的数据
                ServletContext servletContext = request.getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                //用于解析resquest，能从resquest中解析出装有FileItem对象的一个List
                ServletFileUpload upload = new ServletFileUpload(factory);
                //每个FileItem的实例都包含一个文件以及该文件的其他一些属性（文件名、大小等）
                List<FileItem> items = upload.parseRequest(request);
                //指定存储发帖信息中的图片
                File realPath = new File(servletContext.getRealPath("imgs/sendPost"));
                if(!realPath.exists()){
                    realPath.mkdirs();
                }
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    String suffixName = item.getName().substring(item.getName().lastIndexOf("."));
                    saveFileName = LocalDate.now().format(DateTimeFormatter.ISO_DATE)+"-"+ UUID.randomUUID() + suffixName;
                    File saveFile = new File(realPath, saveFileName);
                    item.write(saveFile);
                    //log.info("发帖界面，文件已上传：{}",saveFile.getPath());
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
            return ResponseEntity.fail("图片上传失败~");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //返回数据格式
        /*{
            "code": 0 //0表示成功，其它失败
            ,"msg": "" //提示信息 //一般上传失败后返回
            ,"data": {
                "src": "图片路径"
                 ,"title": "图片名称" //可选
            }
        }*/
        Map<String,String> data = new HashMap<>();
        System.out.println(saveFileName);
        data.put("src","imgs/sendPost/"+saveFileName);
        data.put("title",saveFileName);
        return ResponseEntity.ok(data);
    }

    public static String changetou(HttpServletRequest request){
        String saveFileName = ""; //文件名称
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if(isMultipart){
                //创建工厂（这里用的是工厂模式）
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //从ServletContext中得到上传来的数据
                ServletContext servletContext = request.getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                //用于解析resquest，能从resquest中解析出装有FileItem对象的一个List
                ServletFileUpload upload = new ServletFileUpload(factory);
                //每个FileItem的实例都包含一个文件以及该文件的其他一些属性（文件名、大小等）
                List<FileItem> items = upload.parseRequest(request);
                //指定存储发帖信息中的图片
                File realPath = new File(servletContext.getRealPath("images"));
                if(!realPath.exists()){
                    realPath.mkdirs();
                }
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    // System.out.println(item.getSize());
                    String suffixName = item.getName().substring(item.getName().lastIndexOf("."));
                    saveFileName =LocalDate.now().format(DateTimeFormatter.ISO_DATE)+"-"+ UUID.randomUUID() + suffixName;
                    // System.out.println(saveFileName);

                    File saveFile = new File(realPath, saveFileName);

                    if(item.getSize()<=52224)
                    {item.write(saveFile);
                        //System.out.println(saveFile.length());
                    }
                    else {
                        return null;
                    }
                    //log.info("发帖界面，文件已上传：{}",saveFile.getPath());

                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
            return null;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        //  Map<String,String> data = new HashMap<>();
        //data.put("src","images/"+saveFileName);
        //System.out.println(saveFileName);

        // data.put("title",saveFileName);
        // return ResponseEntity.ok(data);
        return "images/"+saveFileName;
    }
}

