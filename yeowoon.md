```

    <insert id="save">
        INSERT INTO prj_book
            (book_no
            , platform_id, book_title, writer, star_rate, book_comment
            , cur_page, total_page)
        VALUES (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_prj_book.nextval, 4, '0')
        , #{platformId}, #{bookTitle}, #{writer}, #{starRate}, #{bookComment}
        , #{curPage}, #{totalPage})
            )
    </insert>

    <!-- 게시글 정보 삭제 -->
    <delete id="remove">
        DELETE FROM prj_book
        WHERE book_no = #{bookNo}
    </delete>

    <!--  게시글 정보 수정  -->
    <update id="modify">
        UPDATE prj_book
        SET
        platform_id = #{platformId}
        , book_title = #{bookTitle}
        , writer = #{writer}
        , star_rate = #{starRate}
        , book_comment = #{bookComment}
        , cur_page = #{curPage}
        , total_page = #{totalPage}
        , the_end = substr(upper('#{theEnd}'), 1, 1)
        WHERE book_no = #{bookNo}
    </update>

    <resultMap id="bookMap" type="com.project.mybooks.book.domain.Book">
        <result property="userId" column="user_id"/>
        <result property="bookNo" column="book_no"/>
        <result property="platformId" column="platform_id"/>
        <result property="bookTitle" column="book_title"/>
        <result property="starRate" column="star_rate"/>
        <result property="bookComment" column="book_comment"/>
        <result property="curPage" column="cur_page"/>
        <result property="totalPage" column="total_page"/>
        <result property="theEnd" column="the_end"/>
        <result property="regDate" column="reg_date"/>
    </resultMap>

    <resultMap id="bookPlatMap" type="com.project.mybooks.book.domain.BookPlatform">
        <result property="userId" column="user_id"/>
        <result property="bookNo" column="book_no"/>
        <result property="platformId" column="platform_id"/>
        <result property="platformName" column="platform_name"/>
        <result property="bookTitle" column="book_title"/>
        <result property="starRate" column="star_rate"/>
        <result property="bookComment" column="book_comment"/>
        <result property="curPage" column="cur_page"/>
        <result property="totalPage" column="total_page"/>
        <result property="theEnd" column="the_end"/>
        <result property="regDate" column="reg_date"/>
    </resultMap>


    <select id="findAll" resultMap="bookPlatMap">
        SELECT
            user_id, importance
            , book_no, a.platform_id, b.platform_name
            , book_title, writer, star_rate, book_comment
            , cur_page, total_page, the_end, reg_date
        FROM prj_book a
        LEFT OUTER JOIN prj_platform b
        ON a.platform_id = b.platform_id
    </select>

    <select id="findOne" resultMap="bookPlatMap">

    </select>

    <select id="getTotalCount" resultType="int">

    </select>

    <update id="upViewCount">

    </update>

```