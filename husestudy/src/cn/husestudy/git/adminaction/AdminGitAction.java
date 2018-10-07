package cn.husestudy.git.adminaction;

import java.util.List;

import cn.husestudy.git.service.GitService;
import cn.husestudy.git.vo.Git;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台管理：收藏Action
 * @author Drew
 *
 */
public class AdminGitAction extends ActionSupport implements ModelDriven<Git>{

	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象
	private Git git = new Git();
	
	@Override
	public Git getModel() {
		return git;
	}
	
	
	//注入GitService
	private GitService gitService;

	public void setGitService(GitService gitService) {
		this.gitService = gitService;
	}

	
	/**
	 * 无分页：查询所有的收藏
	 * @return
	 */
	public String findAll(){
		List<Git> gList = gitService.findAll();
		ActionContext.getContext().getValueStack().set("gList", gList);
		return "findAll";
	}
	
	
	/**
	 * 删除收藏
	 * @return "deleteSuccess"
	 */
	public String delete(){
		git = gitService.findByGid(git.getGid());
		gitService.delete(git);
		return "deleteSuccess";
	}

}
