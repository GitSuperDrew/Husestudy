package cn.husestudy.husefile.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.husefile.service.HusefileService;
import cn.husestudy.husefile.vo.Husefile;
import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageBean;
import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HusefileAction extends ActionSupport implements ModelDriven<Husefile>{

    private static final long serialVersionUID = 1L;
    private Husefile husefile = new Husefile();
    //注入HusefileService，SendMsgService，WorksService，DiscussService
    private HusefileService husefileService;
    private SendMsgService sendMsgService;
    private WorksService worksService;
    private DiscussService discussService;
    private int page;//用于接受当前页数
    
    
    public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Husefile getHusefile() {
        return husefile;
    }
    public HusefileService getHusefileService() {
        return husefileService;
    }
    public void setHusefile(Husefile husefile) {
        this.husefile = husefile;
    }
    public void setHusefileService(HusefileService husefileService) {
        this.husefileService = husefileService;
    }
    public SendMsgService getSendMsgService() {
		return sendMsgService;
	}
	public WorksService getWorksService() {
		return worksService;
	}
	public DiscussService getDiscussService() {
		return discussService;
	}
	public void setSendMsgService(SendMsgService sendMsgService) {
		this.sendMsgService = sendMsgService;
	}
	public void setWorksService(WorksService worksService) {
		this.worksService = worksService;
	}
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	/**
     * 根据文件ID，查询具体信息
     * @return
     */
    public String findByFid(){
        husefile = husefileService.findByFid(husefile.getFile_id());
        return "findByFid";
    }
    
    //文件上传需要接受的三个属性：
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    
    public File getUpload() {
        return upload;
    }
    public String getUploadFileName() {
        return uploadFileName;
    }
    public String getUploadContentType() {
        return uploadContentType;
    }
    public void setUpload(File upload) {
        this.upload = upload;
    }
    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
    /**
     * 跳转到作品添加页面
     * @return
     */
    public String addPage(){
        return "addPage";
    }
    
    /**
     * 跳转到文件中心
     * @return
     */
    public String fileListCenter(){
      //分页显示所有的file
        PageBean<Husefile> pageBean =  husefileService.findByPage(page);
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
        
      //将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
      //取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
      //首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
        
        return "fileListCenter";
    }
    
    
    /**
     * 上传文件
     * @return
     * @throws IOException
     */
    public String save() throws IOException{
        husefile.setFile_date(new Date());                     //上传文件日期
        husefile.setUpdate_time(new Date());                   //更新文件日期
        //获取当前存在于session中的用户existUser
        User existUser = (User)ServletActionContext.getContext().getSession().get("existUser");
        husefile.setUser(existUser);         //保存用户ID
        if (upload != null) {
            String path = ServletActionContext.getServletContext().getRealPath("/husefile");//获得图片的服务器的路径
            File diskFile = new File(path + "//" + uploadFileName); //创建文件类型对象
            FileUtils.copyFile(upload, diskFile);           //文件上传
            husefile.setFile_addr("husefile/"+uploadFileName);  //保存文件地址
            husefile.setFile_name(uploadFileName);              //上传文件名字
        } else {
            husefile.setFile_name(null);
        }
        husefileService.save(husefile);
        return "saveSuccess";
    }
    
    /**
     * 更新文件信息
     * @return updateSuccess
     * @throws IOException
     */
    public String update() throws IOException {
        //将信息更新到数据库
        husefile.setUpdate_time(new Date()); //更新文件日期
        //获取当前存在于session中的用户existUser
        User existUser = (User)ServletActionContext.getContext().getSession().get("existUser");
        husefile.setUser(existUser);
        //上传文件:
        if (upload != null) {
            String delPath = ServletActionContext.getServletContext().getRealPath("/" + husefile.getFile_addr());
            File file = new File(delPath);
            file.delete();
            //获得上传文件的服务器端路径
            String path = ServletActionContext.getServletContext().getRealPath("/husefile");
            //创建文件类型对象:
            File diskFile = new File(path + "//" + uploadFileName);
            //文件上传：
            FileUtils.copyFile(upload, diskFile);
            husefile.setFile_addr("husefile/" + uploadFileName);
        }
        husefileService.update(husefile);
        return "updateSuccess";
    }
    @Override
    public Husefile getModel() {
        return husefile;
    }
    
    /**
     * 文件下载
     * @return "download"
     * @throws Exception
     */
    private InputStream inputStream;
    private String docName;
    private String contentType;
    
    public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getDocName() throws UnsupportedEncodingException {
    	docName = ServletActionContext.getRequest().getParameter("docName");
    	docName = URLEncoder.encode(docName,"UTF-8");//解决文件名中文显示不出或乱码问题
    	return docName;
    }
    public InputStream getInputStream() throws UnsupportedEncodingException{
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
    
    
    public String download(){
    	docName = ServletActionContext.getRequest().getParameter("docName");
    	System.out.println("fileName:"+docName);
    	inputStream = ServletActionContext.getServletContext().getResourceAsStream("/husefile/"+docName);
    	System.out.println(inputStream);
    	return "download";
    }
    

}
