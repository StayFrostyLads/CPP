package panel;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/*
 * Main class in which all of the GUI ActionListeners are added.
 * Class also functions as a setup for CardLayout.
 * 
 * @author Jack Nebeker
 * @version 1.0.0
 * @since 2022-03-23
 * 
 */
public class Fourier extends JFrame {
	private JPanel cards, title, information, pi, zelda, amongus, naruto;
	CardLayout cL = new CardLayout();
	
	public Fourier() {
		setTitle("Fourier Series");
		setSize(800, 800);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		setFocusable(true);
		
		
		cards = new JPanel(cL);
		title = new TitlePanel();
		information = new InformationPanel();
		pi = new PiPanel();
		zelda = new ZeldaPanel();
		naruto = new NarutoPanel();
		amongus = new AmongUsPanel();
		
		cards.setFocusable(true);
		
		cards.add(title, "title");
		cards.add(information, "information");
		cards.add(pi, "pi");
		cards.add(naruto, "naruto");
		cards.add(zelda, "zelda");
		cards.add(amongus, "amongus");
		add(cards);
		cL.show(cards, "title");
		
		revalidate();
		
		TitlePanel.information.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "information");
			}
		});
		TitlePanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		TitlePanel.pi.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "pi");
			}
		});
		TitlePanel.naruto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "naruto");
			}
		});
		TitlePanel.zelda.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "zelda");
			}
		});
		TitlePanel.amongus.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "amongus");
			}
		});
		InformationPanel.home.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "title");
			}
		});
		InformationPanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		ZeldaPanel.home.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "title");
			}
		});
		ZeldaPanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		AmongUsPanel.home.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "title");
			}
		});
		AmongUsPanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		NarutoPanel.home.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "title");
			}
		});
		NarutoPanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		PiPanel.home.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cL.show(cards, "title");
			}
		});
		PiPanel.quit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		
	}
	
	/*
	 * Method for rotating through the different CardLayout JPanels
	 * @param String
	 * @return null
	 */
	private void showScreen(String a) {
		cL.show(cards, a);
	}
	
	/*
	 * Main method
	 * @param String
	 * @return null
	 */
	public static void main(String[] args) {
		Fourier series = new Fourier();
	}
	
}
