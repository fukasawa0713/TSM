package jp.main;

import java.util.List;
import java.util.Map;

public class GsonConverter {
    public static String toJson(Map<String, Object> result) {
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{");

        // マップ内の各エントリーをJSON形式に変換して連結
        for (Map.Entry<String, Object> entry : result.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            // キーを追加
            jsonBuilder.append("\"").append(key).append("\":");

            // 値を追加
            if (value instanceof List<?>) {
                // リストの場合は配列として処理
                jsonBuilder.append("[");
                List<?> list = (List<?>) value;
                for (Object item : list) {
                    jsonBuilder.append(toJson((Map<String, Object>) item)).append(",");
                }
                if (!list.isEmpty()) {
                    jsonBuilder.deleteCharAt(jsonBuilder.length() - 1); // 最後のカンマを削除
                }
                jsonBuilder.append("]");
            } else if (value instanceof String) {
                // 文字列の場合はダブルクォートで囲む
                jsonBuilder.append("\"").append(value).append("\"");
            } else if (value instanceof Integer) {
                // 数値の場合はそのまま追加
                jsonBuilder.append(value);
            } else if (value instanceof Map) {
                // Mapの場合は再帰的にJSON形式に変換
                jsonBuilder.append(toJson((Map<String, Object>) value));
            } else {
                // その他の場合は空のオブジェクトを追加
                jsonBuilder.append("{}");
            }

            // 要素間の区切りを追加
            jsonBuilder.append(",");
        }

        // 最後のカンマを削除
        if (jsonBuilder.charAt(jsonBuilder.length() - 1) == ',') {
            jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
        }

        jsonBuilder.append("}");
        return jsonBuilder.toString();
    }

}
