        // 북마크 수정
        const $bmList = document.querySelector('#bookmark-list');
        const $bform = document.querySelector('#bookmark-form');
        const [$bfBookNo, $bfBookmarkNo, $bfBookmarkPage, $bfBookConstent, $bfBookmarkButton] = [...$bform
            .firstElementChild.children
        ];

        $bmList.onclick = e => {
            console.log(e.target);
            const [$bmBookNo, $bmBookmarkNo, $bmBookmarkPage, $bmBookmarkContent,
                $bookmarkButton
            ] = [...e.target.parentElement.children]
            console.log($bmBookNo.firstElementChild);
            console.log($bmBookmarkNo.firstElementChild);
            console.log($bmBookmarkPage.firstElementChild);
            console.log($bmBookmarkContent.firstElementChild);

            $bfBookNo.firstElementChild.value = $bmBookNo.firstElementChild.value;
            $bfBookmarkNo.firstElementChild.value = $bmBookmarkNo.firstElementChild.textContent;
            $bfBookmarkPage.firstElementChild.value = $bmBookmarkPage.firstElementChild.textContent;
            $bfBookConstent.firstElementChild.value = $bmBookmarkContent.firstElementChild.nextSibling.textContent;

            console.log($bfBookNo.firstElementChild.value);
            console.log($bfBookmarkNo.firstElementChild.value);
            console.log($bfBookmarkPage.firstElementChild.value);
            console.log($bfBookConstent.firstElementChild.value);
            const $bmDelete = document.querySelector('#bookmarkDelete');
            $bmDelete.value = $bmBookmarkNo.firstElementChild.textContent;
        }

        // 메모 수정
        const $mmList = document.querySelector('#memo-list');
        const $mmform = document.querySelector('#bookmemo-form');
        const [$mmfBookNo, $mmfBookMemoNo, $mmfBookConstent, $mmfBookmarkButton] = [...$mmform
            .firstElementChild.children
        ];

        $mmList.onclick = e => {
            console.log(e.target);
            const [$mmBookNo, $mmBookmemoNo, $mmBookmemoContent] = [...e.target.parentElement.children];


            // console.log($mmfBookNo.firstElementChild);
            // console.log($mmfBookMemoNo.firstElementChild);
            // console.log($mmfBookConstent.firstElementChild);
            console.log($mmBookNo.firstElementChild.value);
            console.log($mmBookmemoNo);
            console.log($mmBookmemoContent.firstElementChild);
            $mmfBookNo.firstElementChild.value = $mmBookNo.firstElementChild.value;
            $mmfBookMemoNo.firstElementChild.value = $mmBookmemoNo.firstElementChild.textContent;
            $mmfBookConstent.firstElementChild.value = $mmBookmemoContent.firstElementChild.textContent;


            const $mmDelte = document.querySelector('#bookmemoDelete');
            $mmDelte.value = $mmBookmemoNo.firstElementChild.textContent;
        }

        // 북마크 등록 필수값 확인
        function validateFormValueBookMark() {
            const $bookmarkPageInput = document.getElementById('bookmarkPage-input');
            const $bookmarkContentInput = document.getElementById('bookmarkContent-input');
            let flag = false;

            if ($bookmarkPageInput.value.trim() === '') {
                alert('페이지는 필수값입니다');
            } else if ($bookmarkContentInput.value.trim() === '') {
                alert('북마크 내용은 필수값입니다');
            } else {
                flag = true;
            }
            return flag;
        }

        const $bookmarkRegBtn = document.getElementById('bookmark-reg-btn');

        $bookmarkRegBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueBookMark()) {
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookmarkInsertForm = document.getElementById('bookmark-insert-form');
            $bookmarkInsertForm.submit();
        };


        // 북마크 수정 필수값 확인
        function validateFormValueBookMarkModify() {
            const $bookmarkPageModify = document.getElementById('bookmarkPage-modify');
            const $bookmarkContentModify = document.getElementById('bookmarkContent-modify');
            let flag = false;

            if ($bookmarkPageModify.value.trim() === '') {
                alert('페이지는 필수값입니다');
            } else if ($bookmarkContentModify.value.trim() === '') {
                alert('북마크 내용은 필수값입니다');
            } else {
                flag = true;
            }
            return flag;
        }

        const $bookmarkModifyBtn = document.getElementById('bookmark-modify-btn');

        $bookmarkModifyBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueBookMarkModify()) {
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookmarkModifyForm = document.getElementById('bookmark-modify-form');
            $bookmarkModifyForm.submit();
        };



        // 메모 등록 필수값 확인
        function validateFormValueMemo() {
            const $bookmemoContentInput = document.getElementById('bookmemoContent-input');
            let flag = false;

            if ($bookmemoContentInput.value.trim() === '') {
                alert('메모 내용은 필수값입니다');
            } else {
                flag = true;
            }
            console.log(flag);
            return flag;
        }

        const $bookmemoRegBtn = document.getElementById('bookmemo-reg-btn');

        $bookmemoRegBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueMemo()) {
                console.log("리턴되라ㅏㅏㅏ");
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookMemoInsertForm = document.getElementById('bookmemo-insert-form');
            $bookMemoInsertForm.submit();
        };


        // 메모 수정 필수값 확인
        function validateFormValueMemoModify() {
            const $bookmemoContentModify = document.getElementById('bookmemoContent-modify');
            let flag = false;

            if ($bookmemoContentModify.value.trim() === '') {
                alert('메모 내용은 필수값입니다');
            } else {
                flag = true;
            }
            console.log(flag);
            return flag;
        }

        const $bookmemoModifyBtn = document.getElementById('bookmemo-modify-btn');

        $bookmemoModifyBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueMemoModify()) {
                console.log("리턴되라ㅏㅏㅏ");
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookMemoModifyForm = document.getElementById('bookmemo-modify-form');
            $bookMemoModifyForm.submit();
        };