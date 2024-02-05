package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Board;

@Mapper
public interface BoardRepository {

	@Select("""
				SELECT * 
				FROM article AS A
				INNER JOIN board AS B
				ON A.boardId = B.id
				WHERE B.id = #{boardId}
				AND delStatus = 0;
			""")
	public Board getBoardById(int boardId);

}