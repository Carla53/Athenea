   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.Ticket   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Athenea     $��12(�  � Title$  Ticket��$	��700��$	��400��.��� -    �Name$ ventas�� � RowDefinitions �� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $	��350 ��� $��* ��� $��* ��� $��60 �.+��� $��0��$��Imagenes\logo.png��$��3��$
��Left=�$��Uniform=�$��5,5,0,0q��� -    ��Name$ lbNombre��$��0��$��2��$��Athenea��$��Italic$�$
��Left=�$��Center=�$
��85,0q�   MaterialDesignLabel#��[  �� -   $ lbCalle��$��Calle: Calle1��$��1��$��Center=�#��[  �� -   $ 
lbConcello��$��Concello: Concello1��$��Center=�$��2��#��[  �� -   $ lbProvincia��$��Pronvincia: Provincia1��$��Center=�$��3��#��[  �� -   $ 
lbTelefono��$��Telefono: 123456789��$��Center=�$��4��#��[  �� -   $ lbEmail��$��Email: email1��$��Center=�$��5��#��[  �� -   $ lbCIF��$��	Cif: cif1��$��Center=�$��6��#��[  �� -	   $ lbFecha��$��7��$��Fecha: ��$��Center=�#��[  $	��5,0q�&   System.Windows.Controls.DataGrid  -
     Name$ dgVentas��$��9��$��3q�   AutoGenerateColumns$ False��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Producto��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� 	 �� Path$	 Producto.Nombre�  $ Importe�� �� $	 Importe�
 �� StringFormat$
 N3��  $ Cantidad�� �� $	 Cantidad��� $��Subotal:��$��10��$
��Left=�$	��5,0q�#��[  �� $��TOTAL:��$��11�����#b91523$
��Left=�$	��5,0q�#��[  �� -   $ lbTotalSinIva��$��10��$
��Left=�$
��70,0q�#��[  �� -   $ 
lbTotalIva��$��11��$
��Left=�$
��70,0q�#��[  