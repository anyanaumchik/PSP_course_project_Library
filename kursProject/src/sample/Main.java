package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.*;
import java.net.Socket;
public class Main extends Application {

    public static Client client;
    private static Socket clientSocket; //сокет для общения
    private static BufferedReader reader; // нам нужен ридер читающий с консоли, иначе как мы узнаем что хочет сказать клиент?
    private static BufferedReader in; // поток чтения из сокета
    private static BufferedWriter out; // поток записи в сокет

    static {
        try {
            client = new Client();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Main() throws IOException {

    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load (getClass ().getResource ("fxml\\sample.fxml"));
        primaryStage.setTitle ("Library");
        primaryStage.setScene (new Scene (root, 700, 400));
        primaryStage.show ();
    }

    public static void main(String[] args) {
        launch (args);

    }

}
