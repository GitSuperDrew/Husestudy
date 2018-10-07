package cn.husestudy.index.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;
import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.major.service.MajorService;
import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.service.Major_UserService;
import cn.husestudy.motto.service.MottoService;
import cn.husestudy.motto.vo.Motto;
import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 首页访问的Action
 * @author Drew
 *
 */
public class IndexAction extends ActionSupport{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    // 注入CollegeService        --- 所有学院展示
    private CollegeService collegeService;
    // 注入MajorService          --- 所有专业展示
    private MajorService majorService;
    // 注入WorksService          --- 作品展示
    private WorksService worksService;
    // 注入SendMsgService        --- 网站服务信息
    private SendMsgService sendMsgService;
    // 注入MottoService         --- 格言随机生成
    private MottoService mottoService;
    // 注入DiscussService        ---评论信息（用于计算关于作品评论的数量进行排序展示）
    private DiscussService discussService;
    
    
    public DiscussService getDiscussService() {
        return discussService;
    }
    public void setDiscussService(DiscussService discussService) {
        this.discussService = discussService;
    }
    public MottoService getMottoService() {
        return mottoService;
    }
    public void setMottoService(MottoService mottoService) {
        this.mottoService = mottoService;
    }
    public SendMsgService getSendMsgService() {
        return sendMsgService;
    }
    public void setSendMsgService(SendMsgService sendMsgService) {
        this.sendMsgService = sendMsgService;
    }
    public CollegeService getCollegeService() {
        return collegeService;
    }
    public void setCollegeService(CollegeService collegeService) {
        this.collegeService = collegeService;
    }
    
    public MajorService getMajorService() {
        return majorService;
    }
    public void setMajorService(MajorService majorService) {
        this.majorService = majorService;
    }
    public WorksService getWorksService() {
        return worksService;
    }
    public void setWorksService(WorksService worksService) {
        this.worksService = worksService;
    }
    /**
     * 执行的访问首页的方法:
     */
    public String execute(){
        // 查询所有一级分类(学院)集合,将一级分类存入到Session的范围:
        List<College> cList = collegeService.findAll();
        ActionContext.getContext().getValueStack().set("cList", cList);
        
        // 查询所有的二级分类（专业）集合,将二级分类存入到session的范围内：
        List<Major> mList = majorService.findAll();
        ActionContext.getContext().getValueStack().set("mList", mList);
        
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
        
        //将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
        
        //首页随机显示出格言信息：
        Motto mottoMessageList = mottoService.getAnyMottoOne();
        ActionContext.getContext().getValueStack().set("mottoMessageList", mottoMessageList);
        
        return "index";
    }
    
    
}
