   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.Perfil   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Perfil��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� -    �Name$ Gestion��$��1��
�������$
{�True��$y�Visible=�.+�� -   $ gContenidoUs��
�������$
{�True��$y�Visible=� � RowDefinitions �� $��60 ��� $
��346* ��� $
��160* �.+�� $
��Left=�$��Bottom=�$��12,10q�.+��� -    ��Name$ cbUser��$	��250��$
��Left=�$��30��G� -    G�Name$ pswUserPassword��$	��250��$
��Left=�$��30��$
��10,0q��� -    ��Name$ 
btnCambiar�� � ToolTip$ cambiar�� " MaterialDesignFlatDarkBgButton#���  $��14(�$��90��$
��10,0q� � Cursor$
 Hand����0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 AccountConvert=�
   Size
 25�� -    ��Name$ gbFormulario��$��Datos de usuario��  MaterialDesignGroupBox#���  $��1��$��0��$��
10,0,10,10q�.��� -   $ gContenedor5a��$
 Hand�� �� $��* ��� $��* ��� $��* ��� $��* � � ColumnDefinitions �� $��* ��� $��* ��� $��* �.+��� -    ��Name$ txtDNI��$��0��$��0��$��0�� �� 
IsReadOnly$
 True��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$	 DNI�� % !MaterialDesignFloatingHintTextBox#��[ $��Center=�$
��10,0q�����  �� Path$	 DNI� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -	   $ 	txtNombre��$��1��$��0��$��1��$
 True��$ Nombre��#��[ $��Center=�$
��10,0q����� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -
   $ txtApellidos��$��2��$��0��$��2��$
 True��$ 	Apellidos��#��[ $��Center=�$��	10,0,10,0q����� $ 	Apellidos�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbCorreo��$��3��$��0��$��3��$
 True��$ Correo��#��[ $��Center=�$��	10,0,10,0q����� $ Correo�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtClave��$��4��$��1��$��0��$
 True��$ Clave��#��[ $��Center=�$
��10,0q�$��38������ $ Clave�$ TwoWay=�$ PropertyChanged=�$
 True���� -   $ txtTelefono��$��5��$��1��$��1��$
 True��$ Telefono��#��[ $��Center=�$
��10,0q����� $ Telefono�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True��(  "System.Windows.Controls.DatePicker  -     Name$ 	dpFechReg��$��2��$��6��$��1��$��Center=� ( $MaterialDesignFloatingHintDatePicker#��[ $ Fecha Registro��$��50��$��
10,0,10,15q�   SelectedDate �� $ FechaRegistro�$ OneWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtRol��$��8��$��1��$��3��$
 True�� �� TextWrapping$
 Wrap=�$	 Rol��#��[ $��Center=�$��	10,0,10,0q����� $ 
Rol.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -    ��Name$ Imagen��$��2��$��3��$��5q�$ Imagen������ *Imagen+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ btnBuscarLibros��$ Editar Foto��$��3��$��3��$	��125��$��38��$��Center=�$��Center=�#���  $��0q�$��0,30,0,0q�$
 Hand����  $	 	ImageEdit=�
 25�� -   $ gbFormularioDireccion��$'��!Datos de la direccion del usuario��#���  $��2��$��0��$��
10,0,10,10q�.��� -   $ gContenedorDireccion��$
 Hand�� �� $��* ��� $��* � �� $��* ��� $��* �.+��� -   $ txtCalle��$��0��$��0��$��0��$
 True��$ Calle��#��[ $��Center=�$
��10,0q����� $ Calle�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtCP��$��1��$��0��$��1��$
 True��$ Codigo Postal��#��[ $��Center=�$
��10,0q����� $ CodigoPostal�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtProvincia��$��2��$��1��$��0��$
 True��$ 	Provincia��#��[ $��Center=�$��	10,0,10,0q����� $ 	Provincia�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ 
cbConcello��$��3��$��1��$��1��$
 True��$ Concello��#��[ $��Center=�$��	10,0,10,0q����� $ Concello�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ sbNotification��$	��Top=�   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  