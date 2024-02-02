package jp.main.model;

public class Student {

    // 学生のID
    private int id;

	// 学生の名前
	private String name;

	// 学生の年齢
	private int age;

	// 学生のクラス
	private String clazz;

    // 学生の性別
    private String sex;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", clazz='" + clazz + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
