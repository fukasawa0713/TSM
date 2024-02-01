<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<%@ page import="java.util.Date" %>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>成績検索</title>
</head>
<body>

<h1>成績検索</h1>
<% Date datex = new Date();
   out.println("<p>検索日時：" + datex + "</p>");

%>
<label for="studentId">学生番号を入力：</label>
<input type="text" id="studentId" placeholder="学生番号を入力してください">
<button onclick="showResults()">検索</button>

<h2>学生の成績表</h2>
<table border="1">
    <thead>
    <tr>
        <th>科目</th>
        <th>成績</th>
    </tr>
    </thead>
    <tbody id="resultTableBody">
    <!-- ここに検索結果が表示されます -->
    </tbody>
</table>

<h2>クラスと学校の順位</h2>
<p id="classRank">クラス順位： - </p>
<p id="schoolRank">学校順位： - </p>

<script type="text/javascript">
    function showResults() {
    // 入力された学生番号を取得
    var studentId = document.getElementById("studentId").value;

    // TODO: 学生番号に基づいて成績と順位を検索し、テーブルと順位の表示を更新するJavaScriptコードを記述
    // 実際の状況に合わせて適切なJavaScriptコードを記述してください

    // 以下はサンプルコードです。実際はバックエンドのロジックに基づいて呼び出しと更新を行うべきです
    var sampleData = {
    subjects: [
    { name: "国語", score: 90 },
    { name: "数学", score: 85 },
    { name: "英語", score: 88 }
    ],
    classRank: 5,
    schoolRank: 15
    };

    updateTable(sampleData.subjects);
    updateRanks(sampleData.classRank, sampleData.schoolRank);
    }

    function updateTable(subjects) {
    var tableBody = document.getElementById("resultTableBody");
    tableBody.innerHTML = ""; // テーブルの内容をクリア

    subjects.forEach(function(subject) {
    var row = document.createElement("tr");
    var cell1 = document.createElement("td");
    var cell2 = document.createElement("td");

    cell1.textContent = subject.name;
    cell2.textContent = subject.score;

    row.appendChild(cell1);
    row.appendChild(cell2);

    tableBody.appendChild(row);
    });
    }

    function updateRanks(classRank, schoolRank) {
    document.getElementById("classRank").textContent = "クラス順位：<%= datex %>";
    document.getElementById("schoolRank").textContent = "学校順位：" + schoolRank;
    }
</script>

</body>
</html>
