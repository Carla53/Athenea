   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5   	       Athenea.Factura   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Athenea     5   	   $��14(�5   	     � Title$  Factura��5	   	   $
��1000��6   $	��750��6'   .��5
      � -   5         �Name$ compra��5
       � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $	��400 �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $
��139* �6   �� 5       $
��118* �6   �� 5!      $	��59* �6   �� 5"      $	��84* �6   .+�5%   
   �� $��0��6   $��Imagenes\logo.png��6   $��3��68   $��3��6H   $��Right=�6Y   $��Uniform=�6u   $��5q�6�   �� 5&   
   -   5         ��Name$ lbCalle��5&      $��Calle1��6!   $��1��62   $
��Left=�6?   $	��5,0q�6Z      MaterialDesignLabel#��[  6g   �� 5'   
   -   5        $ lbDireccion��5'      $ ��45200 Concello, Provincia ��6%   $
��Left=�6J   $	��5,0q�6e   $��2��6r   #��[  6   �� 5(   
   $��Facturar a:��6   $
��Left=�6&   $
��15,0q�6A   $��4��6O   #��[  6\   �� 5)   
   -   5        $ lbFProvincia��5)      $��Pronvincia2��6&   $
��Left=�6<   $
��25,0q�6W   $��5��6e   #��[  6r   �� 5*   
   -   5        $ lbFCalle��5*      $��Calle2��6"   $
��Left=�63   $
��25,0q�6N   $��6��6\   #��[  6i   �� 5+   
   -   5        $ lbFDireccion��5+      $��25003 Concello, Provincia��6&   $
��Left=�6J   $
��25,0q�6e   $��7��6s   #��[  6�   �� 5-   
   $��	Enviar a:��6   $
��Left=�6$   $��4��6?   $��1��6L   #��[  6\   �� 5.   
   -   5        $ lbEProvincia��5.      $��Pronvincia2��6&   $
��Left=�6<   $��5��6W   $��1��6d   $
��15,0q�6t   #��[  6�   �� 5/   
   -   5        $ lbECalle��5/      $��Calle2��6"   $
��Left=�63   $��6��6N   $��1��6[   $
��15,0q�6k   #��[  6y   �� 50   
   -	   5        $ lbEDireccion��50      $��25003 Concello, Provincia��6&   $
��Left=�6J   $��7��6e   $��1��6r   $
��15,0q�6�   #��[  6�   �� 52   
   $��Nº de Factura:��6   $��5��6)   $��2��66   $��Right=�6F   $	��5,0q�6b   #��[  6o   �� 53   
   $��Fecha:��6   $��6��6!   $��2��6.   $��Right=�6>   #��[  6Z   �� 55   
   -
   5        $ lbNumFactura��55      $��5��6&   $��3��63   $
��Left=�6C   $	��5,0q�6^   #��[  6k   �� 56   
   -   5        $ lbFecha��56      $��6��6!   $��3��6.   $
��Left=�6>   $	��5,0q�6Y   #��[  6f   &   System.Windows.Controls.DataGrid  58   
   -   5          Name$ 	dgCompras��58         
IsReadOnly$
 true��6&   $��10��68   $��4��6F      AutoGenerateColumns$ False��6Z      Columns 59      0  *System.Windows.Controls.DataGridTextColumn  5;      ,  &System.Windows.Controls.DataGridColumn	   Header$	 Producto��6%   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 67   ��  �� Path$ Producto.Nombre�  5<      $	 Cantidad��6%   
 67   �� $ Cantidad�  5=      $	 Importe��6%   
 66   �� $ Importe� �� StringFormat$ N3��5@      �� 5B   
   $��	Subtotal:��6   $��11��6$   $��1��62   $��Right=�6B   $	��5,0q�6^   #��[  6k   �� 5C   
   $��TOTAL:��6   $��12��6!   $��1��6/   $��Right=�6?   $	��5,0q�6[   #��[  6h   �� 5D   
   -   5        $ lbTotalSinIva��5D      $��11��6'   $��2��65   $
��Left=�6E   $	��5,0q�6`   #��[  6m   $��8��6�   �� 5E   
   -   5        $ 
lbTotalIva��5E      $��12��6$   $��2��62   $
��Left=�6B   $	��5,0q�6]   #��[  6j   $��8��6�   �� 5G   
   $!��Condiciones y forma de pago��6   $��13��66   $��0��6D   $
��Left=�6T   $	��5,0q�6o   #��[  6|   �� 5H   
   $3��-El pago se realizará en un plazo de 15 días��6   $��14��6F   $��2��6T   $
��Left=�6h   $	��5,0q�6�   #��[  6�   5J      5K      