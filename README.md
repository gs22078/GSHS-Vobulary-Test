# GSHS-Vobulary-Test
경기과학고 영어 단어 시험 공부를 위한 TeX 문서입니다. 단어 교재는 [능률보카 고교 필수편](https://www.nebooks.co.kr/pages/book/view.asp?c=BD01000014)입니다.

## Features
아래 명령어에서 `range`에는 '21-50', '24-26,48'와 같이 범위를 설정할 수 있습니다.

`\study[range]`는 단어 공부를 할 때 사용하는 기능입니다. `range`에 해당하는 범위의 단어와 예문을 보여 줍니다.

`\test[range]`는 설정한 `range` 범위에서 시험지를 task1에서 6문제, task2에서 6문제, task3에서 8문제를 출제하여 보여 줍니다.

`\task[task=task no, day={range}, num=num of probs]`는 `task no`에 해당하는 task를 `range` 범위에서 `num of probs`개의 문제를 출제하여 보여 줍니다. 예를 들어, `\task[task=3, day{39-40}, num=30]`은 Task3를 Day 39-40 범위에서 30문제를 출제합니다.

## Contribution
`vocab.dat` 파일에 오타나 오류를 발견한 경우 Issue를 열어 제보하거나 직접 수정하여 Pull request를 요청해 주세요.

`gshs-vocab.cls`의 코드를 개선한 경우에도 Pull request를 요청해 주세요.

## Copyright
`GSHS Vocabulary Test.tex` 파일과 `gshs-vocab.cls` 파일은 공교육 기관에서 교육적 목적 또는 개인이 학습용으로 사용할 수 있습니다.

`vocab.dat` 파일에 있는 단어와 번역, 예문 등은 NE 능률 출판사의 교재에서 가져온 것으로 해당 교재의 저자와 출판사에게 저작권이 있습니다.

해당 파일은 이 tex 문서에서만 사용 가능합니다. 위 tex 문서도 교육용 목적으로만 사용하실 수 있으며, 그 외 상업적 목적 등의 사용을 금지합니다.

> 이 저장소는 경기과학고 텍 사용자협회에서 제공하는 것이 아닙니다.
