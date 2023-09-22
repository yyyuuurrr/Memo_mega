package com.cona.memo.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cona.memo.post.domain.Post;
import com.cona.memo.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	public PostRepository postRepository;

	public int addPost(int userId, String title, String content) {
		
		return postRepository.insertPost(userId, title, content);

	}
	
	public List<Post> getPostList(int userId) {
		
		return postRepository.selectPostList(userId);
	
	}
	
}
