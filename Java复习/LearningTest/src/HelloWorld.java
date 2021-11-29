

public class HelloWorld {

    public static void main(String[] args){
        System.out.println("Hello World");

        System.out.println("Debug test");

        test();

        System.out.println("Run test");
        
        new JunitTest().test();

    }
    public static  void test(){
        
        System.out.println("PRINT FROM FUNCTION");
    }
}
