   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestDesarrollador   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Usuarios��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)� � Cursor$
 Hand��.��� .+�� -    �Name$ gContenidoUs��
�������$
{�True��$y�Visible=� � RowDefinitions �� $��60 ��� $
��345* ��� $
��148* � � ColumnDefinitions �� $	��11* ��� $	��14* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�$	��0,5q�.+��� -    ��Name$ btnNuevo�� � ToolTip$ limpiar formulario�� " MaterialDesignFlatDarkBgButton#���  $��14(�$
 Hand��$��90��$��6,5,0,0q���0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Clear=�
   Size
 24�� -   $ btnGuardarLi��$ registar��#���  $��14(�$��90��$��5,5,0,0q�$
 Hand����  $	 userPlus=�
 24�� -   $ 	btnBorrar��$ eliminar��#���  $��5,5,0,0q�$��90��$��14(�$
 Hand����  $	 Delete=�
 24�� -   $ 	btnImagen��$ cargar imagen��#���  $��5,10,5,5q�$��90��$��14(�$
 Hand����  $	 	ImageEdit=�
 24� $ 
Horizontal=�$
��Left=�$
��3,10q�$��Bottom=�$��1��.+��� -    ��Name$ txtBusquedaUs��$��0��$
��Left=�$	��201�� % !MaterialDesignFloatingHintTextBox#��[ )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Valor a buscar��$��Center=��� -   $ 	btnBuscar��$ Buscar Usuario��$��85��$��38��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,0,0,0q�$
 Hand����  $	 Search=�
 24�� -    ��Name$ gbFormulario��$��Datos de usuario��  MaterialDesignGroupBox#���  $��1��$��0��$��5,2,10,5q�.��� -	   $ gContenedor5a��$
 Hand�� �� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* � �� $��* ��� $��* �.+��� -
   $ txtDNI��$��0��$��0��$��0��$	 DNI��#��[ $��Center=�$
��10,0q�����  �� Path$	 DNI� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -   $ 	txtNombre��$��1��$��0��$��1��$ Nombre��#��[ $��Center=�$
��10,0q����� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtApellidos��$��2��$��0��$��2��$ 	Apellidos��#��[ $��Center=�$��	10,0,10,0q����� $ 	Apellidos�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtClave��$��3��$��0��$��3��$ Clave��#��[ $��Center=�$
��10,0q�$��38������ $ Clave�$ TwoWay=�$ PropertyChanged=�$
 True���� -   $ cbCorreo��$��4��$��0��$��4��$ Correo��#��[ $��Center=�$��	10,0,10,0q����� $ Correo�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��(  "System.Windows.Controls.DatePicker  -     Name$ 	dpFechReg��$��5��$��5��$��0��$��Center=� ( $MaterialDesignFloatingHintDatePicker#��[ $ Fecha Registro��$��50��$��	10,0,10,7q�   SelectedDate �� $ FechaRegistro�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtTelefono��$��6��$��1��$��0��$ Telefono��#��[ $��Center=�$
��10,0q����� $ Telefono�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -    ��Name$ cbRol��$��7��$��1��$��1��$	 Rol�� & "MaterialDesignFloatingHintComboBox#��[ $��Center=�$��	10,0,10,0q� �� Text �� $ 
Rol.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -    ��Name$ Imagen��$��1��$��2��$��4��$	��Top=�$ Imagen������ *Imagen+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ gbFormularioDireccion��$'��!Datos de la direccion del usuario��#���  $��2��$��0��$��5,0,10,5q�.��� -   $ gContenedorDireccion��$
 Hand�� �� $��* ��� $��* � �� $��* ��� $��* �.+��� -   $ txtCalle��$��0��$��0��$��0�� �� 
IsReadOnly$
 True��$ Calle��#��[ $��Center=�$
��10,0q����� $ Calle�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtCP��$��1��$��0��$��1��$
 True��$ Codigo Postal��#��[ $��Center=�$
��10,0q����� $ CodigoPostal�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtProvincia��$��2��$��1��$��0��$
 True��$ 	Provincia��#��[ $��Center=�$��	10,0,10,0q����� $ 	Provincia�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ 
cbConcello��$��3��$��1��$��1��$
 True��$ Concello��#��[ $��Center=�$��	10,0,10,0q����� $ Concello�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��� $ 
Horizontal=�$��1��$��0��$
��Left=�$��
214,15,0,0q�$��2��$	��772��$	��Top=�$��57��&   System.Windows.Controls.DataGrid  -     Name$ 
dgUsuarios��   
IsReadOnly$
 true��$��1��$��0,2,5,5q�   SelectionMode$ Single=�$   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns$ False��$��2��$��Center=�$��Center=�$��1��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$	 DNI��1  +System.Windows.Controls.DataGridBoundColumn    Binding  �� $	 DNI�  $ Nombre��  �� $ Nombre�  $ 	Apellidos��  �� $ 	Apellidos�  $ Correo��  �� $ Correo�  $ Clave��  �� $ Clave�  $ 	Teléfono��  �� $ Telefono�  $ Fecha de registro��  �� $ fechaReg�  $	 Rol��  �� $ 
Rol.Nombre�  $ 	Direccion��  �� $ 	Direccion�4  .System.Windows.Controls.DataGridTemplateColumn  !   Width5	  /System.Windows.Controls.DataGridLengthConverter$	! 100	 "   CellTemplate" �� .R��� ���� *Imagen+'
  !MaterialDesignThemes.Wpf.Snackbar
  -   # 
 Name$# sbNotification��$	��Top=�$��Center=�$ 
  MessageQueue$ 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  