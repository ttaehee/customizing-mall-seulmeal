package shop.seulmeal.web.operation;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
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
import shop.seulmeal.service.domain.Comment;
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
	
	@Value("${operation.query.pageUnit}")
	int pageUnit;
	
	@Value("${operation.query.pageSize}")
	int pageSize;
	
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
	public String insertOperation(@PathVariable int postNo,Model model) {
		System.out.println(postNo);
		Post post = new Post();
		post.setPostNo(postNo);
		// 자료 가져오기
		post = operationService.getOperation(post);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postNo", post.getPostNo());
		
		// 첨부파일 가져오기
		List<Attachments> list = attachmentsService.getAttachments(map);
		post.setAttachments(list);
		
		// 문의사항일시 답변가져오기
		if(post.getPostStatus().equals("3")) {
			List<Comment> cList = operationService.getListAnswer(post.getPostNo());
			post.setComments(cList);
		}
		
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
		Post post = new Post();
		post.setPostNo(postNo);
		
		post = operationService.getOperation(post);
		
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
	
	@GetMapping(value={"getListOperation/{postStatus}/{currentPage}/{searchCondition}",
				"getListOperation/{postStatus}/{currentPage}",
				"getListOperation/{postStatus}"})
	public String getListOperation(@PathVariable int postStatus, Model model,@PathVariable(required = false) String currentPage, @PathVariable(required = false) String searchCondition) {
		System.out.println(postStatus);
		
		Search search = new Search();
		if(currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
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
	
	@GetMapping("getChatBot")
	public String getChatBot() {
		
		return "chatBot/chatBot";
	}
	
	
}
