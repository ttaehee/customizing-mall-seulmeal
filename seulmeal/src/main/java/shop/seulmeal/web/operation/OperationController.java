package shop.seulmeal.web.operation;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
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
		
	private String path =System.getProperty("user.dir")+"/src/main/webapp/resources/attachments/";
	
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
	@Transactional(rollbackFor = Exception.class)
	public String insertOperation(Post post, String userId, Model model, MultipartFile[] uploadfile,
					MultipartFile thumnailFile, Attachments attachments, String summerImg, HttpSession session) throws IllegalStateException, IOException {
		User user = (User)session.getAttribute("user");
		System.out.println(user);
		post.setUser(user);
			
		List<String> imgList = new ArrayList<String>();
		
		if(summerImg != null) {
			String[] sImg = summerImg.split(",");		
			for(int i=0; i<sImg.length; i++) {
				if(!post.getContent().contains(sImg[i])) {
					imgList.add(sImg[i]);
				}
			}
			attachmentsService.summerCopy(imgList);
		}
		if(post.getPublicStatus() == null) {
			post.setPublicStatus("0");
		}
		
		// 이벤트 썸내일
		if(thumnailFile != null) {
			String name = UUID.randomUUID().toString()+"_"+thumnailFile.getOriginalFilename();
			post.setThumnail(name);
			
			File newFileName = new File(path,name);
			thumnailFile.transferTo(newFileName);
		}
		
		System.out.println("POST  :"+post);
		operationService.insertOperation(post);
		
		System.out.println(uploadfile.length);
		if(uploadfile != null) {
			attachments.setPostNo(Integer.toString(post.getPostNo()));
			
			attachmentsService.insertAttachments(uploadfile, attachments);
		}
		model.addAttribute("post",post);
		
		return "redirect:getOperation/"+post.getPostStatus()+"/"+post.getPostNo();		
	}
	
	@GetMapping("getOperation/{postStatus}/{postNo}")
	public String insertOperation(@PathVariable int postNo,@PathVariable String postStatus,Model model) {
		System.out.println(postNo);
		Post post = new Post();
		post.setPostNo(postNo);
		post.setPostStatus(postStatus);
		
		post = operationService.getOperation(post);
		System.out.println(post.getComments());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postNo", post.getPostNo());
		
		// 泥⑤��뙆�씪 媛��졇�삤湲�
		List<Attachments> list = attachmentsService.getAttachments(map);
		post.setAttachments(list);
		System.out.println(post);
		
		List<Comment> cl =post.getComments();
		for (Comment comment : cl) {
			map = new HashMap<String,Object>();
			map.put("commentNo", comment.getCommentNo());
			comment.setAttachments(attachmentsService.getAttachments(map));
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
	
	@GetMapping("updateOperation/{postStatus}/{postNo}")
	public String updateOperation(@PathVariable int postNo, @PathVariable String postStatus, Model model) {
		System.out.println(postNo);
		Post post = new Post();
		post.setPostNo(postNo);
		post.setPostStatus(postStatus);
		
		post = operationService.getOperation(post);
		
		// 첨부파일
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postNo", post.getPostNo());
		
		List<Attachments> list = attachmentsService.getAttachments(map);
		post.setAttachments(list);
		
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
	@Transactional(rollbackFor = Exception.class)
	public String updateOperation(Post post, Model model, Attachments attachments, MultipartFile thumnailFile,
							MultipartFile[] uploadfile, String deleteAttachmentNo, String deleteAttachmentName) throws IllegalStateException, IOException {
		System.out.println("수정사항 : "+post);
		
		// 삭제
		attachmentsService.deleteAttachments(deleteAttachmentNo,deleteAttachmentName);
		// 등록
		System.out.println(uploadfile.length);
		if(uploadfile.length > 1) {
			attachments.setPostNo(Integer.toString(post.getPostNo()));
			
			attachmentsService.insertAttachments(uploadfile, attachments);
		}
		
		// 이벤트 썸내일
		if(thumnailFile != null) {
			String name = UUID.randomUUID().toString()+"_"+thumnailFile.getOriginalFilename();
			post.setThumnail(name);
			
			File newFileName = new File(path,name);
			thumnailFile.transferTo(newFileName);
		}
		
		if(post.getPublicStatus() == null) {
			post.setPublicStatus("0");
		}
		
		operationService.updateOperation(post);
		
		model.addAttribute("post",post);
		
		return "redirect:getOperation/"+post.getPostStatus()+"/"+post.getPostNo();
	}
	
	@GetMapping(value={"getListOperation/{postStatus}/{currentPage}/{searchCondition}",
				"getListOperation/{postStatus}/{currentPage}",
				"getListOperation/{postStatus}"})
	public String getListOperation(@PathVariable int postStatus, Model model, Search search,
							@PathVariable(required = false) String currentPage, @PathVariable(required = false) String searchCondition) {
				
		if(currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
				
		Map<String,Object> map = operationService.getListOperation(search, postStatus);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);		
		System.out.println("RESULTPAGE : "+resultPage);
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
