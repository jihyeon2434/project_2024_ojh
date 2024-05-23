package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {
	// 데이터베이스에 새로운 게시글을 삽입하는 메소드. 생성 시각과 업데이트 시각이 자동으로 설정됩니다.
	@Insert("""
			INSERT INTO
			article SET
			regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			boardId = #{boardId},
			shopName = #{shopName},
			title = #{title}, `body` = #{body}
			""")
	public void writeArticle(int memberId, String title, String body, int boardId, String shopName);

	  // 데이터베이스에서 마지막으로 삽입된 ID를 검색하는 메소드 - 새로 생성된 게시글의 ID를 얻는 데 유용합니다.
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	  // ID를 기준으로 게시글을 검색하는 메소드
	@Select("""
			SELECT *
			FROM article
			WHERE id = #{id}
			""")
	public Article getArticle(int id);

	 // 표시 목적으로 추가 작성자 정보와 함께 게시글을 검색하는 사용자 지정 SQL 스크립트
	@Select("""
			<script>
				SELECT A.*, M.nickname AS extra__writer
				FROM article AS A
				INNER JOIN `member` AS M
				ON A.memberId = M.id
				WHERE A.id = #{id}
				GROUP BY A.id
			</script>
				""")
	public Article getForPrintArticle(int id);

    // ID를 기준으로 데이터베이스에서 게시글을 삭제하는 메소드
	@Delete("DELETE FROM article WHERE id = #{id}")
	public void deleteArticle(int id);

	// 게시글의 내용을 수정하는 메소드. 제목이나 본문이 비어 있지 않은 경우에만 해당 필드를 업데이트합니다.
	@Update("""
			<script>
			UPDATE article
				<set>
					<if test="title != null and title != ''">title = #{title},</if>
					<if test="body != null and body != ''">`body` = #{body},</if>
					updateDate = NOW()
				</set>
			WHERE id = #{id}
			</script>
				""")
	public void modifyArticle(int id, String title, String body);

	// 게시글 목록을 검색하는 메소드. 모든 게시글을 최신순으로 정렬하여 반환합니다.
	@Select("""
			SELECT A.*, M.nickname AS extra__writer
			FROM article AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			ORDER BY A.id DESC
			""")
	public List<Article> getArticles();

	// 특정 게시판 ID와 검색 키워드에 따라 게시글 수를 계산하는 메소드. 검색 키워드 유형에 따라 제목이나 본문을 필터링합니다.
	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM article AS A
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

	// 특정 게시글의 조회수를 증가시키는 메소드
	@Update("""
			UPDATE article
			SET hitCount = hitCount + 1
			WHERE id = #{id}
			""")
	public int increaseHitCount(int id);

    // 특정 게시글의 조회수를 검색하는 메소드
	@Select("""
			SELECT hitCount
			FROM article
			WHERE id = #{id}
			""")
	public int getArticleHitCount(int id);

	 // 특정 사용자 ID와 기타 매개변수를 사용하여 페이지화된 방식으로 게시글을 검색하는 복잡한 쿼리
	 @Select("""
	            <script>
	            SELECT A.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
	            FROM article AS A
	            INNER JOIN `member` AS M
	            ON A.memberId = M.id
	            LEFT JOIN `reply` AS R
	            ON A.id = R.relId
	            WHERE A.memberId = #{memberId}
	            <if test="boardId != 0">
	                AND A.boardId = #{boardId}
	            </if>
	            <if test="searchKeyword != ''">
	                <choose>
	                    <when test="searchKeywordTypeCode == 'title'">
	                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
	                    </when>
	                    <when test="searchKeywordTypeCode == 'body'">
	                        AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
	                    </when>
	                    <otherwise>
	                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
	                        OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
	                    </otherwise>
	                </choose>
	            </if>
	            GROUP BY A.id
	            ORDER BY A.id DESC
	            <if test="limitFrom >= 0">
	                LIMIT #{limitFrom}, #{limitTake}
	            </if>
	            </script>
	            """)
	    public List<Article> getForPrintArticles(int memberId, int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode,
	            String searchKeyword);

	// 게시글의 즐겨찾기를 하는 메소드
	@Update("""
			UPDATE article
			SET goodReactionPoint = goodReactionPoint + 1
			WHERE id = #{relId}
			""")
	public int increaseGoodReactionPoint(int relId);

	// 게시글의 즐겨찾기를 취소하는 메소드
	@Update("""
			UPDATE article
			SET goodReactionPoint = goodReactionPoint - 1
			WHERE id = #{relId}
			""")
	public int decreaseGoodReactionPoint(int relId);





	// 특정 게시글의 즐겨찾기 개수를 조회하는 메소드
	@Select("""
			SELECT goodReactionPoint
			FROM article
			WHERE id = #{relId}
			""")
	public int getGoodRP(int relId);

	

	// 다음 게시글 ID를 예측하여 반환하는 메소드
	@Select("""
			SELECT MAX(id) + 1
			FROM article
			""")
	public int getCurrentArticleId();

	// 특정 업체명(shopName)을 가진 게시글을 검색하는 메소드.
	@Select("""
	        SELECT * FROM article 
	        WHERE shopName = #{companyName}
	        """)
	List<Article> findArticlesByCompanyName(String companyName);


}