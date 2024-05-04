package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.OnlineConArticle;


@Mapper
public interface OnlineConsultShopRepository {

	

	/*
	 * 
	 * @Select(""" SELECT MAX(id) + 1 FROM OnlineConArticle """) public int
	 * getCurrentArticleId();
	 */

	    
	    
	    @Insert("""
				INSERT INTO
				OnlineConArticle SET
				regDate = NOW(),
				updateDate = NOW(),
				memberId = #{loginedMemberId},
				title = #{title}, `body` = #{body}
				""")
		public void writeArticle(int loginedMemberId, String title, String body);

	    
		@Select("SELECT LAST_INSERT_ID()")
		public int getLastInsertId();


		@Select("""
				SELECT *
				FROM OnlineConArticle
				WHERE id = #{id}
				""")
		public OnlineConArticle getArticle(int id);


		@Select("""
				<script>
					SELECT A.*, M.nickname AS extra__writer
					FROM OnlineConArticle AS A
					INNER JOIN `member` AS M
					ON A.memberId = M.id
					WHERE A.id = #{id}
					GROUP BY A.id
				</script>
					""")
		public OnlineConArticle getForPrintArticle(int loginedMemberId, int id);

		@Select("""
				SELECT MAX(id) + 1
				FROM OnlineConArticle
				""")
		public int getCurrentArticleId();
			
	


		

		

	
}