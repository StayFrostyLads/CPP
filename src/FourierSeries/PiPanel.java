package panel;

import javax.swing.*;

/*
 * Class for creating GUI specifics for one of the image JPanels.
 * 
 * @author Jack Nebeker
 * @version 1.0.0
 * @since 2022-03-23
 * 
 */
public class PiPanel extends JPanel {
	
	public static JButton home, quit;
	private JLabel title;
	
	public PiPanel() {
		setLayout(null);
		title = new JLabel("Pi"); 
		title.setBounds(325,20,200,100);
		add(title);
		
		home = new JButton("Back to Home");
		home.setBounds(250,600,300,50);
		add(home);
		
		quit = new JButton("Exit Application");
		quit.setBounds(620,20,150,50);
		add(quit);
		
	}

}
