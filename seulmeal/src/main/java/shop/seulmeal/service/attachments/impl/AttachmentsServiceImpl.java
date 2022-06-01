package shop.seulmeal.service.attachments.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.mapper.AttachmentsMapper;

@Service("attachmentsServiceImpl")
public class AttachmentsServiceImpl implements AttachmentsService {
	
	private String path ="C:/resource/";
	
	@Autowired
	private AttachmentsMapper attachmentsMapper;

	@Override
	public int insertAttachments(MultipartFile[] uploadFile, Attachments attachments) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		List<Attachments> list = new ArrayList<>();
		
		for (MultipartFile file : uploadFile) {
			if(!file.isEmpty()) {
				
				Attachments attachment = new Attachments();
				String name = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
				attachment.setAttachmentName(name);
				list.add(attachment);
				
				File newFileName = new File(path,name);
				file.transferTo(newFileName);
			}
		}
		
		attachmentsMapper.insertListAttachments(list);
		
		return 0;
	}

	@Override
	public int deleteAttachments(int no) {
		// TODO Auto-generated method stub
		return 0;
	}
}
