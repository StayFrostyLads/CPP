package panel;

import javax.swing.*;
import java.awt.*;

/*
 * Class for creating GUI specifics for the Information Panel that contains information about Fourier Series with a visual aid.
 * 
 * @author Jack Nebeker
 * @version 1.0.0
 * @since 2022-03-23
 * 
 */
public class InformationPanel extends JPanel {
	public static JButton home, quit;
	private JLabel title, info;
	
	public InformationPanel() {
		setLayout(null);
		title = new JLabel("Information"); 
		title.setBounds(325,20,200,100);
		add(title);
		
		info = new JLabel("<html>A Fourier series is a periodic function in terms of an infinite sum of sines and cosines.<br/>A Fourier series is able to draw the images contained in the application through something known as a Fourier transform.<br/>A Fourier transform method uses a set of x and y coordinates to calculate the epicycles (circle moving around another circle) needed to draw the image.<br/>The Epicycles then rotate in a certain order at a certain pace to create the images you see in the application.</html>");
		info.setBounds(200, 200, 350, 350);
		add(info);
		
		home = new JButton("Back to Home");
		home.setBounds(250,600,300,50);
		add(home);
		
		quit = new JButton("Exit Application");
		quit.setBounds(620,20,150,50);
		add(quit);
		
	}

}
