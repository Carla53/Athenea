   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5   	       Athenea.GestApp   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Athenea     5   	   c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	     � Title$  Athenea��5	   	   $	��580��67   $
��1261��6G    � WindowStartupLocation$ CenterScreen=�6W      MaterialDesignBody#���   5
   	   $
��Bold"�5   	   $��16(�5   	   $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5   	    � ShowInTaskbar$ False��5   	   .��5      � -   5         �Name$ dgContenedor��5      
������� � ColumnDefinitions 5   
   �� 5      ��6   ��  �� Path$ Width� �� ElementName$ spMenu���� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��80 �6   .+�5   
   �� -   5         ��Name$ spMenu��5      $��0��6%   $	��100��65   .+�5      �� -   5        	 ��Name$	 btnVenta��5      
 � ToolTip$
 Vender��6'   $��80��68   $��55��6C   $��	0,15,0,10q�6O     MaterialDesignRaisedButton#���  6b    � Cursor$
 Hand��6�   ��6�   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Shopping=�   Size 406�   �� 5       -   5        $	 	btnCompra��5       $
 Comprar��6(   $��80��6:   $��55��6E   $��0,0,0,10q�6Q   #���  6c   $
 Hand��6�   ��6�     $
 Shop=� 406�   �� 5"      -   5        $	 btnPapeleria��5"      $
 Gestionar Papelería��6+   $��80��6I   $��55��6T   $��0,0,0,10q�6`   #���  6r   $��16(�6�   ��6�     $ PencilRuler=� 406�   �� 5$      -   5        $	 btnModificarLibros��5$      $
 Gestionar Libros��61   $��80��6L   $��55��6W   $��0,0,0,10q�6c   #���  6u   $��16(�6�   $
 Hand��6  ��6�     $ BookEdit=� 406  �� 5&      -   5        $	 btnProoveedor��5&      $
 Gestionar Proveedores��6,   $��80��6L   $��55��6W   $��0,0,0,10q�6c   #���  6u   $��16(�6�   $
 Hand��6  ��6�     $ 
AccountTie=� 406  �� 5(      -   5        $	 btnPefil��5(      $
 Pefil��6'   $��80��67   $��55��6B   $��0,0,0,10q�6N   #���  6`   $��16(�6�   $
 Hand��6�   ��6�     $ Account=� 406�   �� 5*      -	   5        $	 btnDesarrollador��5*      $
 Ajustes de desarrollador��6/   $��80��6R   $��55��6]   $��0,0,0,10q�6i   #���  6{   $��16(�6�   $
 Hand��6  ��6�     $ Tools=� 406  5-      �� 5/   
   -
   5        $	 btnAyuda��5/      $
 Ayuda��6#   $��1��63   $��80��6@   $��55��6K   #���  6W   $��16(�6�   $
 Hand��6�   ��6�     $ QuestionMark=� 406�    � 51   
   -   5          �Name$ frame��51      $��1��6   $��2��6/     � NavigationUIVisibility$ Hidden=�6@   53      54      