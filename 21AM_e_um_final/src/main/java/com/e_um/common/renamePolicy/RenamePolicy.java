package com.e_um.common.renamePolicy;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;

public class RenamePolicy {

	public static String renamepolicy (HttpServletRequest req, MultipartFile upFile, String renamePart ){
		String path = req.getServletContext().getRealPath("/resources/upload/"+renamePart+"/");

		
		
		
		File dir = new File(path);
		
				if(!dir.exists()) {
					dir.mkdirs();
				} 
				
				

						
		String originalFileName=upFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String reName  = renamePart+"_"+sdf.format(System.currentTimeMillis())+"_"+ranNum+ext;

						
		
				try {
					upFile.transferTo(new File(path+reName));
				} catch(IOException e) {
					e.printStackTrace();
				}
		
					
				
				
				
				return reName;
	}
}
