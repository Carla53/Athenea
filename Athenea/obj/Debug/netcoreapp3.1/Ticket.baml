   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5   	       Athenea.Ticket   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Athenea     5   	   $��14(�5   	     � Title$  Ticket��5	   	   $	��800��6   $	��400��6%   .��5
      � -   5         �Name$ ventas��5
       � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $	��400 �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��80 �6   .+�5   
   �� $��0��6   $��Imagenes\logo.png��6   $��2��68   $
��Left=�6I   $��Uniform=�6d   �� 5   
   -   5         ��Name$ lbNombre��5      $��0��6"   $��2��6/   $��Athenea��6@   $��Italic$�6R   $
��Left=�6e   $��Center=�6�   $��	63,0,0,15q�6�      MaterialDesignLabel#��[  6�   �� 5   
   -   5        $ lbCalle��5      $��Calle: Calle1��6!   $��1��69   $��Center=�6F   $	��5,0q�6c   #��[  6p   �� 5   
   -   5        $ 
lbConcello��5      $��Concello: Concello1��6$   $��Center=�6B   $��2��6_   $	��5,0q�6l   #��[  6y   �� 5   
   -   5        $ lbProvincia��5      $��Pronvincia: Provincia1��6%   $��Center=�6F   $��3��6c   $	��5,0q�6p   #��[  6}   �� 5    
   -   5        $ 
lbTelefono��5       $��Telefono: 123456789��6$   $��Center=�6B   $��4��6_   $	��5,0q�6l   #��[  6y   �� 5!   
   -   5        $ lbEmail��5!      $��Email: email1��6!   $��Center=�69   $��5��6V   $	��5,0q�6c   #��[  6p   �� 5"   
   -   5        $ lbCIF��5"      $��	Cif: cif1��6   $��Center=�63   $��6��6P   $	��5,0q�6]   #��[  6j   �� 5$   
   -	   5        $ 
lbNumVenta��5$      $��7��6$   $
��Left=�61   $	��5,0q�6L   #��[  6Y   $��8��6�   �� 5%   
   -
   5        $ lbFecha��5%      $��8��6!   $
��Left=�6.   $	��5,0q�6I   #��[  6V   $��8��6�   &   System.Windows.Controls.DataGrid  5'   
   -   5          Name$ dgVentas��5'      $��9��6%   $��3q�62      AutoGenerateColumns$ False��6=      Columns 5(      0  *System.Windows.Controls.DataGridTextColumn  5*      ,  &System.Windows.Controls.DataGridColumn   Header$ Producto��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 67   �� 	 �� Path$	 Producto.Nombre�  5+      $ Importe��6%    66   �� $	 Importe�
 �� StringFormat$
 N3��  5,      $ Cantidad��6%    67   �� $	 Cantidad�5/      �� 51   
   $��Subotal:��6   $��10��6#   $
��Left=�61   $	��5,0q�6L   #��[  6Y   �� 52   
   $��TOTAL:��6   $��11��6!   ���#b91523$
��Left=�6D   $	��5,0q�6_   #��[  6l   �� 53   
   -   5        $ lbTotalSinIva��53      $��10��6'   $
��Left=�65   $
��70,0q�6P   #��[  6^   �� 54   
   -   5        $ 
lbTotalIva��54      $��11��6$   $
��Left=�62   $
��70,0q�6M   #��[  6[   55      56      