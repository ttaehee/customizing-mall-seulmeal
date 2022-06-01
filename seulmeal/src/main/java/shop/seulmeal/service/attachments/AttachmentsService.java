package shop.seulmeal.service.attachments;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.service.domain.Attachments;

public interface AttachmentsService {
	public int insertAttachments(MultipartFile[] uploadFile, Attachments attachments) throws IllegalStateException, IOException;
	public int deleteAttachments(int no);
}
