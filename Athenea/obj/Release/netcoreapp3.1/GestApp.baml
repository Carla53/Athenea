   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestApp   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     � Title$  Athenea��$	��580��$
��1261�� � WindowStartupLocation$ CenterScreen=�   MaterialDesignBody#���   $
��Bold"�$��16(�$X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)� � ShowInTaskbar$ False��.��� -    �Name$ dgContenedor��
������� � ColumnDefinitions �� ����  �� Path$ Width� �� ElementName$ spMenu���� $��* � � RowDefinitions �� $��* ��� $��80 �.+��� -    ��Name$ spMenu��$��0��$	��100��.+��� -   	 ��Name$	 btnVenta��
 � ToolTip$
 Vender��$��80��$��55��$��	0,15,0,10q�  MaterialDesignRaisedButton#���   � Cursor$
 Hand����0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Shopping=�   Size 40�� -   $	 	btnCompra��$
 Comprar��$��80��$��55��$��0,0,0,10q�#���  $
 Hand����  $
 Shop=� 40�� -   $	 btnPapeleria��$
 Gestionar Papelería��$��80��$��55��$��0,0,0,10q�#���  $��16(���  $ PencilRuler=� 40�� -   $	 btnModificarLibros��$
 Gestionar Libros��$��80��$��55��$��0,0,0,10q�#���  $��16(�$
 Hand����  $ BookEdit=� 40�� -   $	 btnProoveedor��$
 Gestionar Proveedores��$��80��$��55��$��0,0,0,10q�#���  $��16(�$
 Hand����  $ 
AccountTie=� 40�� -   $	 btnPefil��$
 Pefil��$��80��$��55��$��0,0,0,10q�#���  $��16(�$
 Hand����  $ Account=� 40�� -	   $	 btnDesarrollador��$
 Ajustes de desarrollador��$��80��$��55��$��0,0,0,10q�#���  $��16(�$
 Hand����  $ Tools=� 40�� -
   $	 btnAyuda��$
 Ayuda��$��1��$��80��$��55��#���  $��16(�$
 Hand����  $ QuestionMark=� 40 � -     �Name$ frame��$��1��$��2��  � NavigationUIVisibility$ Hidden=�