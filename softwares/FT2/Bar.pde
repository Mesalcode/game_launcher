class Toolbar extends JFrame implements FocusListener{
  Toolbar(){
    setSize(1000,280);
    setVisible(true);
    addFocusListener(this);
    //setAlwaysOnTop(true); //TODO Bessere Lösung finden (Grund: Kann verursachen, dass Änderungen sich nicht direkt anwenden.
   setResizable(false);
    add(new JLabel("                           "));
     add(new JLabel("Werkzeuggröße  "));
    final String[] proposedSizes = {String.valueOf(brushSize),"1","2","3","4","5","10","15","20","25","30","35","40","45","50","55","60","70","75","100","125","150","175","200","225","250","275","300","350","400"};
    final JComboBox sizesList = new JComboBox(proposedSizes);
    sizesList.setSelectedIndex(0);
    sizesList.setEditable(true);
    sizesList.addActionListener (new ActionListener () {
    public void actionPerformed(ActionEvent e) {
      try{
        setBrushSize(Integer.parseInt(proposedSizes[sizesList.getSelectedIndex()]));
        
      }catch(Exception ex){
        
        
      }
    }
});
add(sizesList);
add(new JLabel("      Füllung geometrischer Formen  "));
 final String[] proposedFillings = {"Gefüllt","Ohne Füllung"};
  final JComboBox fillingsList = new JComboBox(proposedFillings);
  if (filled)
     fillingsList.setSelectedIndex(0);
    else
    fillingsList.setSelectedIndex(1);
    
   
    fillingsList.addActionListener (new ActionListener () {
    public void actionPerformed(ActionEvent e) {
      try{
       if (proposedFillings[fillingsList.getSelectedIndex()].equalsIgnoreCase("Gefüllt")){
       filled=true;refreshFilled();
         }else{
      filled=false;disableFilling();
       }
        
      }catch(Exception ex){
        
        
      }
    }
});
    add(fillingsList);
    add(new JLabel("      Farbauswahl  "));
    final JButton colorButton = new JButton();
    colorButton.setPreferredSize(new Dimension(100,40));
    colorButton.setBackground(new Color(brushColorR,brushColorG,brushColorB));
     colorButton.addActionListener (new ActionListener () {
    public void actionPerformed(ActionEvent e) {
      getUserColor();
      colorButton.setBackground(new Color(brushColorR,brushColorG,brushColorB));
    }
});
    add(colorButton);
      add(new JLabel("                           "));
    
    
    setLocation(getX(),getY()+100);
   setLayout(new FlowLayout());
    getContentPane().setBackground(Color.white);
    add(new JLabel("       Werkzeuge   "));
    for (int i = 0;i< hotbarTools.length;i++){
      final int currI = i;
      ImageIcon currIcon = new ImageIcon(sketchPath(hotbarTools[i].upsizedName));
     
      JButton toAdd = new JButton(currIcon);
      toAdd.setBackground(Color.white);
      
      toAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
              hotbarTools[selectedTool].onSwitch();
              hotbarTools[currI].activate();
              hotbarTools[currI].init();
              selectedTool = currI;
               cursor(hotbarTools[currI].getCursor());
         previewCount = 0;
         ((java.awt.Canvas) surface.getNative()).requestFocus();
            }
        });
      add(toAdd);
      
    }
    add(new JLabel("                     Effekte   "));
      for (int i = 0;i< hotbarEffects.length;i++){
      final int currI = i;
      ImageIcon currIcon = new ImageIcon(sketchPath(hotbarEffects[i].upsizedName));
  
      JButton toAdd = new JButton(currIcon);
      toAdd.setBackground(Color.white);
      
      toAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
              ((java.awt.Canvas) surface.getNative()).requestFocus();
             hotbarEffects[currI].apply();
             
              selectedEffect = currI;
              
       
            }
        });
      add(toAdd);
     
    }
     add(new JLabel("                                                                                                            "));
     JButton clearButton = new JButton("Fläche leeren");
      clearButton.setBackground(Color.white);
       clearButton.addActionListener(new ActionListener(){
        @Override
        public void actionPerformed(ActionEvent e){
        ((java.awt.Canvas) surface.getNative()).requestFocus();
           save("cache/save"+saveStatus+".png");
           background(150);
          clearOnClick = true;
          save("cache/save"+saveStatus+".png");
          
          
        }
      });
      add(clearButton);
      JButton undoButton = new JButton("Letze Änderung rückgängig machen");
      undoButton.setBackground(Color.white);
      undoButton.addActionListener(new ActionListener(){
        @Override
        public void actionPerformed(ActionEvent e){
         ((java.awt.Canvas) surface.getNative()).requestFocus();
          undo();
          
        }
      });
    
         JButton loadButton = new JButton("Bild einfügen");
     loadButton.setBackground(Color.white);
      loadButton.addActionListener(new ActionListener(){
        @Override
        public void actionPerformed(ActionEvent e){
    //  ((java.awt.Canvas) surface.getNative()).requestFocus(); //Fokus auf das Fenster setzen, damit die Mausklicks (mousePressed()) registriert werden.
        loadImage();
        }});
       
    
     JButton saveButton = new JButton("Bild speichern");
     saveButton.setBackground(Color.white);
      saveButton.addActionListener(new ActionListener(){
        @Override
        public void actionPerformed(ActionEvent e){
         String userName = showInputDialog(null,"Wie möchten sie ihr Bild benennen?");
   if (userName!=null){
   try {
   save("my_images/"+  userName + ".png");
     showMessageDialog(null,"Ihr Bild wurde unter ,," + userName + ".png\" gespeichert." );
   }catch (Exception e2){
       showMessageDialog(null,"Ungültiger Dateiname!","Fehler",ERROR_MESSAGE );
     
   }
  
        }
        }});
          add(undoButton);
        add(loadButton);
   add(saveButton);
    setVisible(true);
  }
  public void focusGained(FocusEvent fe){drawFocused=false;}
  public void focusLost(FocusEvent fe){drawFocused=true;}
}
