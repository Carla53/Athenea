   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.Factura   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Athenea     $��14(�  � Title$  Factura��$
��1100��$	��750��.��� -    �Name$ compra�� � RowDefinitions �� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $	��600 ��� $��* ��� $��* ��� $��* ��� $��* ��� $��30 � � ColumnDefinitions �� $
��139* ��� $
��118* ��� $	��59* ��� $	��84* �.+��� $��0��$��Imagenes\logo.png��$��3��$��3��$��Right=�$��Uniform=�$��0,5,5,0q��� -    ��Name$ lbCalle��$��Calle1��$��1��$
��Left=�$	��5,0q�   MaterialDesignLabel#��[  �� -   $ lbDireccion��$ ��45200 Concello, Provincia ��$
��Left=�$	��5,0q�$��2��#��[  �� $��Facturar a:��$
��Left=�$
��15,0q�$��4��#��[  �� -   $ lbFProvincia��$��Pronvincia2��$
��Left=�$
��25,0q�$��5��#��[  �� -   $ lbFCalle��$��Calle2��$
��Left=�$
��25,0q�$��6��#��[  �� -   $ lbFDireccion��$��25003 Concello, Provincia��$
��Left=�$
��25,0q�$��7��#��[  �� $��	Enviar a:��$
��Left=�$��4��$��1��#��[  �� -   $ lbEProvincia��$��Pronvincia2��$
��Left=�$��5��$��1��$
��15,0q�#��[  �� -   $ lbECalle��$��Calle2��$
��Left=�$��6��$��1��$
��15,0q�#��[  �� -	   $ lbEDireccion��$��25003 Concello, Provincia��$
��Left=�$��7��$��1��$
��15,0q�#��[  �� $��Nº de Factura:��$��5��$��2��$��Right=�$	��5,0q�#��[  �� $��Fecha:��$��6��$��2��$��Right=�#��[  �� -
   $ lbNumFactura��$��5��$��3��$
��Left=�$	��5,0q�#��[  �� -   $ lbFecha��$��6��$��3��$
��Left=�$	��5,0q�#��[  &   System.Windows.Controls.DataGrid  -     Name$ 	dgCompras��   
IsReadOnly$
 true��$��9��$��4��   AutoGenerateColumns$ False��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn	   Header$	 Producto��1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 ��  �� Path$ Producto.Nombre�  $	 Cantidad��
 �� $ Cantidad�  $	 Importe��
 �� $ Importe� �� StringFormat$ N3���� $��	Subtotal:��$��10��$��1��$��Right=�$	��5,0q�#��[  �� $��TOTAL:��$��11�����#b91523$��1��$��Right=�$	��5,0q�#��[  �� -   $ lbTotalSinIva��$��12��$��2��$
��Left=�$	��5,0q�#��[  $��8���� -   $ 
lbTotalIva��$��13��$��2��$
��Left=�$	��5,0q�#��[  $��8���� $!��Condiciones y forma de pago��$��12��$��0��$
��Left=�$	��5,0q�#��[  �� $3��-El pago se realizará en un plazo de 15 días��$��13��$��2��$
��Left=�$	��5,0q�#��[  