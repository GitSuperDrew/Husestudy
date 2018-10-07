package cn.husestudy.college.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONInterceptor;
import org.apache.struts2.json.JSONUtil;
import org.apache.struts2.json.annotations.JSON;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;
import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.major.service.MajorService;
import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.service.Major_UserService;
import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.user.service.UserService;
import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 多个学院进行查询，按照collegeID一次进行夺标遍历查询。
 * （优化提醒：可以改进数据库表的设计，在每个作品的ID上添加collegeID,majorID）
 * 以此，优化查询的效率。
 * @author Drew
 * 注入的对象：collegeService,majorService,userService,worksService,major_UserService
 * @param CollegeService
 * @param MajorService
 * @param Major_UserService
 * @param UserService
 */
public class CollegeAction extends ActionSupport implements ModelDriven<College>{
    
    private static final long serialVersionUID = 1L;
    //注入CollegeService, MajorService, Major_UserService, UserService, WorksService, DiscussService
    private CollegeService collegeService;
    private MajorService majorService;
    private Major_UserService major_UserService;
    private UserService userService;
    private WorksService worksService;
    private SendMsgService sendMsgService;
    private DiscussService discussService; 
    private College college = new College();
    
    @Override
    public College getModel() {
        return college;
    }
    
    public College getCollege() {
        return college;
    }
    public void setCollege(College college) {
        this.college = college;
    }
    public SendMsgService getSendMsgService() {
        return sendMsgService;
    }
    public void setSendMsgService(SendMsgService sendMsgService) {
        this.sendMsgService = sendMsgService;
    }
    public Major_UserService getMajor_UserService() {
        return major_UserService;
    }
    public void setMajor_UserService(Major_UserService major_UserService) {
        this.major_UserService = major_UserService;
    }
    public CollegeService getCollegeService() {
        return collegeService;
    }
    public MajorService getMajorService() {
        return majorService;
    }
    public UserService getUserService() {
        return userService;
    }
    public WorksService getWorksService() {
        return worksService;
    }
    public void setCollegeService(CollegeService collegeService) {
        this.collegeService = collegeService;
    }
    public void setMajorService(MajorService majorService) {
        this.majorService = majorService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public void setWorksService(WorksService worksService) {
        this.worksService = worksService;
    }
    public DiscussService getDiscussService() {
        return discussService;
    }
    public void setDiscussService(DiscussService discussService) {
        this.discussService = discussService;
    }
    
    
    
    //每个学院都有一个相应的主页：以后可以优化为同一个模板
    public String findAllWorksByCollege1(){         //理学院LXY
        collegeCid(1);
        return "collegeLXY";
    }
    public String findAllWorksByCollege2(){        //马克思主义学院MKS
        collegeCid(2);
        return "collegeMKS";
    }
    public String findAllWorksByCollege3(){        //经济与管理学院JG
        collegeCid(3);
        return "collegeJG";
    }
    public String findAllWorksByCollege4(){        //人文与社会科学学院RWJY
        collegeCid(4);
        return "collegeRWJY";
    }
    public String findAllWorksByCollege5(){        //体育学院TY
        collegeCid(5);
        return "collegeTY";
    }
    public String findAllWorksByCollege6(){        //外国语学院WGY
        collegeCid(6);
        return "collegeWGY";
    }
    public String findAllWorksByCollege7(){        //传媒学院CM
        collegeCid(7);
        return "collegeCM";
    }
    public String findAllWorksByCollege8(){        //电子与信息工程学院DX
        collegeCid(8);
        return "collegeDX";
    }
    public String findAllWorksByCollege9(){        //土木与环境工程学院TM
        collegeCid(9);
        return "collegeTM";
    }
    public String findAllWorksByCollege10(){        //化学与生物工程学院HS
        collegeCid(10);
        return "collegeHS";
    }
    public String findAllWorksByCollege11(){        //音乐与舞蹈学院YW
        collegeCid(11);
        return "collegeYW";
    }
    public String findAllWorksByCollege12(){        //美术与艺术设计学院MY
        collegeCid(12);
        return "collegeMY";
    }
    public String findAllWorksByCollege13(){        //国学院GXY
        collegeCid(13);
        return "collegeMY";
    }
    
    /**
     * 公共方法提取
     * @param cid
     */
    public void collegeCid(Integer cid){
        college.setCid(cid);
      //1.将专业所有信息放入到值栈中
        HashSet<Major> majors = majorService.findAllMajorByCid(college.getCid());
        ActionContext.getContext().getValueStack().set("majors", majors);
      //2.取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
      //3.首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
       //4.将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
        
        HashSet<Integer> uids = new HashSet<Integer>();
        HashSet<Integer> uids2 = new HashSet<Integer>();
        HashSet<Integer> uids3 = new HashSet<Integer>();
        HashSet<Works> worksSet = new HashSet<Works>();
        HashSet<Works> worksSet2 = new HashSet<Works>();
       //5.根据cid，查询出所有的mid：
        List<Integer> mids = majorService.findAllMidByCid(college.getCid());
        List<Integer> mids2 = new ArrayList<Integer>();
        //6.根据mid，查询出所有的uid，存放到list集合中：
        for (Integer mid : mids) {
            if (mid != null) {
                mids2.add(mid);
            }
        }
        for (Integer mid2 : mids2) {
            uids = major_UserService.findAllUidByMid(mid2);
            if (uids != null) {
                if (uids != null && uids.size() > 0) {
                    uids2.addAll(uids);
                }
            }
        }
        for (Integer uid2 : uids2) {
            if (uid2 != null) {
                uids3.add(uid2);
            }
        }
        //根据uid，查询出所有的wid，存放到worksList集合中：
        for (Integer uid3 : uids3) {
            worksSet = worksService.findAllWorksByUid(uid3);
            if (worksSet != null && worksSet.size() > 0) {
                worksSet2.addAll(worksSet);
            }
        }
        ActionContext.getContext().getValueStack().set("worksSet", worksSet2);
    }

    /**
     * 查询出每个学院最新的前8个作品：?????????优化问题：专业--学生：学生有多个专业，所以学院中的最新的8个作品会出现其他学院的作品
     * @throws IOException 
     */
    public void showEightWorks() throws IOException{
        //按照分支学院取出8条最新的作品：
        Integer max = 8;
        List<Integer> mids = new ArrayList<Integer>();
        List<Integer> uids = new ArrayList<Integer>();
        List<Works> wlist = new ArrayList<Works>();
        List<Works> eightList = new ArrayList<Works>();
        
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer cid = Integer.parseInt(request.getParameter("cid"));
        if (majorService.findAllMidByCid(cid) != null && majorService.findAllMidByCid(cid).size() > 0) {
            mids.addAll(majorService.findAllMidByCid(cid));
        }
        for (Integer mid : mids) {
            if (mid != null) {
                if (major_UserService.findAllUidByMid(mid) != null && major_UserService.findAllUidByMid(mid).size() > 0) {
                    uids.addAll(major_UserService.findAllUidByMid(mid));
                }
            }
        }
        for (Integer uid : uids) {  //这里由于是只需要8个作品显示，建议：不需要全部取出作品再去选择8个。
            if (uid != null) {
                if (worksService.findAllWorksByUid(uid) != null && worksService.findAllWorksByUid(uid).size() > 0) {
                    wlist.addAll(worksService.findAllWorksByUid(uid));
                }
            }
        }/* "<s:property value='%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#w.wdate})}'/>"+ */
        if (wlist!=null && wlist.size()>0) {
            eightList.add(wlist.get(0));
        }
        ActionContext.getContext().getValueStack().set("eightList", eightList);
        
    }
    
    //根据学院的ID，查询出对应的所有的作品。
    public String findWorksFileCenter() throws IOException{
        List<Integer> mids = new ArrayList<Integer>();
        List<Integer> uids = new ArrayList<Integer>();
        List<Works> wlist = new ArrayList<Works>();
        List<Works> eightList = new ArrayList<Works>();
        
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer cid = Integer.parseInt(request.getParameter("cid"));
        if (majorService.findAllMidByCid(cid) != null && majorService.findAllMidByCid(cid).size() > 0) {
            mids.addAll(majorService.findAllMidByCid(cid));
        }
        for (Integer mid : mids) {
            if (mid != null) {
                if (major_UserService.findAllUidByMid(mid) != null && major_UserService.findAllUidByMid(mid).size() > 0) {
                    uids.addAll(major_UserService.findAllUidByMid(mid));
                }
            }
        }
        for (Integer uid : uids) {  //这里由于是只需要8个作品显示，建议：不需要全部取出作品再去选择8个。
            if (uid != null) {
                if (worksService.findAllWorksByUid(uid) != null && worksService.findAllWorksByUid(uid).size() > 0) {
                    wlist.addAll(worksService.findAllWorksByUid(uid));
                }
            }
        }
        if (wlist!=null && wlist.size()>0) {
            eightList.add(wlist.get(0));
        }
        return "findWorksFileCenterJSON";
    }
    
    
    /**
     * 根据专业编号查询出所属专业编号学生的作品：
     * @return
     * @throws UnsupportedEncodingException 
     */
    public void findWorksByMid() throws UnsupportedEncodingException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String mid = request.getParameter("mid");
        System.out.println("你选择的专业编号为：" + mid);
        HashSet<Integer> uidsByMidSet = new HashSet<Integer>();
        HashSet<Works> works = new HashSet<Works>();
        List<Works> works2 = new ArrayList<Works>();
        //将数据存储在map里面，在转换成json类型数据:
        //jsonMap.clear();//清空jsonMap中的数据
        //根据专业编号MID，查询出所属专业编号学生的作品：
        HashSet<Integer> uidsByMid = major_UserService.findAllUidByMid(Integer.parseInt(mid));
        for (Integer uid : uidsByMid) {
            if (uid != null) {
                uidsByMidSet.add(uid);
            }
        }
        for (Integer um : uidsByMidSet) {
            works = worksService.findAllWorksByUid(um);
            works2.addAll(works);
        }
        ActionContext.getContext().getValueStack().set("worksSetMid", works2);
    }
}
