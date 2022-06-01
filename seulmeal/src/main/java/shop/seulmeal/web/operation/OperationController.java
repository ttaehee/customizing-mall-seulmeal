package shop.seulmeal.web.operation;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.operation.OperationService;

@Controller
@RequestMapping("/operation/*")
public class OperationController {
	
	@Autowired
	private OperationService operationService;
	
	@Autowired
	private AttachmentsService attachmentsService;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	public OperationController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@GetMapping("insertOperation/{postStatus}")
	public String insertOperation(@PathVariable int postStatus) {
		
		if(postStatus == 1) {
			return "operation/insertOperationNotice";
		} else if(postStatus == 2) {
			return "operation/insertOperationEvent";
		} else {
			return "operation/insertOperationQuery";
		}
	}
	
	@PostMapping("insertOperation")
	@Transactional
	public String insertOperation(Post post, String userId, Model model, MultipartFile[] uploadfile, Attachments attachments) throws IllegalStateException, IOException {
		User user = new User();
		user.setUserId(userId);
		post.setUser(user);
		
		System.out.println("POST 가져온거 :"+post);
		operationService.insertOperation(post);
		
		attachments.setPostNo(Integer.toString(post.getPostNo()));
		
		attachmentsService.insertAttachments(uploadfile, attachments);
		
		model.addAttribute("post",post);
		
		return "redirect:getOperation/"+post.getPostNo();		
	}
	
	@GetMapping("getOperation/{postNo}")
	public String insertOperation(@PathVariable int postNo, Model model) {
		System.out.println(postNo);
		
		Post post = operationService.getOperation(postNo);
		
		model.addAttribute("post",post);
		
		if(post.getPostStatus().equals("1")){
			return "operation/getOperationNotice";
		} else if(post.getPostStatus().equals("2")) {
			return "operation/getOperationEvent";
		} else {
			return "operation/getOperationQuery";
		}
	}
	
	@GetMapping("updateOperation/{postNo}")
	public String updateOperation(@PathVariable int postNo, Model model) {
		System.out.println(postNo);
		
		Post post = operationService.getOperation(postNo);
		
		model.addAttribute("post",post);
		
		if(post.getPostStatus().equals("1")){
			return "operation/updateOperationNotice";
		} else if(post.getPostStatus().equals("2")) {
			return "operation/updateOperationEvent";
		} else {
			return "operation/updateOperationQuery";
		}
	}
	
	@PostMapping("updateOperation")
	public String updateOperation(Post post, Model model) {
		System.out.println("업데이트 수정할 내용 : "+post);
		operationService.updateOperation(post);
		model.addAttribute("post",post);
		
		return "redirect:getOperation/"+post.getPostNo();
	}
	
	@GetMapping("getListOperation/{postStatus}")
	public String getListOperation(@PathVariable int postStatus, Model model) {
		System.out.println(postStatus);
		
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(search);
				
		Map<String,Object> map = operationService.getListOperation(search, postStatus);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);		
		
		model.addAttribute("list",(List<Post>)map.get("list"));
		model.addAttribute("page",resultPage);
		model.addAttribute("search",search);
		
		if(postStatus == 1) {
			return "operation/listOperationNotice";
		} else if(postStatus == 2) {
			return "operation/listOperationEvent";
		} else {
			return "operation/listOperationQuery";
		}
	}
}
