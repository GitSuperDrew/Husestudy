package cn.husestudy.works.adminaction;


import java.util.List;

import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台管理员的AdminWorksAction
 * @author Drew
 *
 */
public class AdminWorksAction extends ActionSupport implements ModelDriven<Works>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的类对象
	private Works works = new Works();	
	@Override
	public Works getModel() {
		return works;
	}
	
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	//注入WorksService
	private WorksService worksService;
	public void setWorksService(WorksService worksService) {
		this.worksService = worksService;
	}
	
	/**
	 * 查询所有的商品：带分页
	 * @return   "findAll"
	 */
/*	public String findAll(){
		PageBean<Works> pageBean = worksService.findByPage(page);
		//将pageBean数据存入到值栈中：
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//页面跳转：
		return "findAll";
	}*/
	
	//无分页：查询所有的作品
		public String findAll(){
			List<Works> wList = worksService.findAll();
			ActionContext.getContext().getValueStack().set("wList", wList);
			return "findAll";
		}
	
	
	/**
	 * 删除作品
	 * @return  "deleteSuccess"
	 */
	public String delete(){
		//根据ID查询作品信息：
		works = worksService.findByWid(works.getWid());
		//删除数据库中的作品记录
		worksService.delete(works);
		//页面跳转
		return "deleteSuccess";
	}

	
	/**
	 * 编辑作品信息：
	 * @return  "editSuccess"
	 */
	public String edit(){
		//根据作品ID，查询作品信息
		works = worksService.findByWid(works.getWid());
		
		
		//页面跳转到编辑页面
		return "editSuccess";
	}
	

}
