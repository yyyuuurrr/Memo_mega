package com.cona.memo.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cona.memo.common.FileManager;
import com.cona.memo.post.domain.Post;
import com.cona.memo.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	public PostRepository postRepository;	
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		// 파일을 특정 디렉토리(폴더)에 저장하고,
		// 저장된 파일을 접근 할 수 있는 url 경로를 만들고 table에 저장
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, title, content, imagePath);
		
	}
	
	public List<Post> getPostList(int userId) {
		
		return postRepository.selectPostList(userId);
		
	}
	
	public Post getPost(int id){
		
		return postRepository.selectPost(id);
	}
	
}
