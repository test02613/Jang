package com.aplus.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttachFileVO {

	// 파일명
	private String fileName;

	// 업로드 경로
	private String uploadPath;

	// 파일명-난수
	private String uuid;

	// 이미지
	private boolean image;

}
