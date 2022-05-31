package shop.seulmeal.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.Attachments;

@Mapper
public interface AttachmentsMapper {
	public int insertAttachments(Attachments attachments);
	public int deleteAttachments(int no);
	public List<Attachments> getListAttachments();
	public int insertListAttachments(List<Attachments> attachments);
}
