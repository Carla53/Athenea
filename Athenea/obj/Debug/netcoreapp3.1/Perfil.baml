   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.Perfil   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5        N� Title$  Gestionar Perfil��5	         MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � -   5         �Name$ Gestion��5      $��1��6   
�������$
{�True��6D   $y�Visible=�6U   .+�5   
   � -   5        $ gContenidoUs��5      
�������$
{�True��6>   $y�Visible=�6O    � RowDefinitions 5      �� 5      $��60 �6    �� 5      $
��346* �6    �� 5      $
��160* �6    .+�5      � $
��Left=�6   $��Bottom=�63   $��12,10q�6N   .+�5      �� -   5         ��Name$ cbUser��5      $	��250��6+   $
��Left=�67   $��30��6R   G� 5      -   5         G�Name$ pswUserPassword��5      $	��250��67   $
��Left=�6C   $��30��6^   $
��10,0q�6j   6x   �� 5      -   5         ��Name$ 
btnCambiar��5       � ToolTip$ cambiar��6n    " MaterialDesignFlatDarkBgButton#���  6�   $��14(�6�   $��90��6�   $
��10,0q�6�    � Cursor$
 Hand��6�   ��6-   0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 AccountConvert=�
   Size
 256�   5      �� 5!      -   5         ��Name$ gbFormulario��5!      $��Datos de usuario��6-     MaterialDesignGroupBox#���  6G   $��1��6x   $��0��6�   $��
10,0,10,10q�6�   .��5#      � -   5        $ gContenedor5a��5#      $
 Hand��6.    5%      �� 5&      $��* �6(   �� 5'      $��* �6(   �� 5(      $��* �6(   �� 5)      $��* �6(    � ColumnDefinitions 5,      �� 5-      $��* �6+   �� 5.      $��* �6+   �� 5/      $��* �6+   .+�52      �� -   5         ��Name$ txtDNI��52   �   $��0��6   $��0��6+   $��0��68    �� 
IsReadOnly$
 True��6H   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$	 DNI��6Z    % !MaterialDesignFloatingHintTextBox#��[ 6   $��Center=�6�   $
��10,0q�6�   ��6�   ��  �� Path$	 DNI� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� 57      -	   5        $ 	txtNombre��57   �   $��1��6   $��0��6+   $��1��6;   $
 True��6H   $ Nombre��6Z   #��[ 6�   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5<      -
   5        $ txtApellidos��5<   �   $��2��6   $��0��6+   $��2��6;   $
 True��6H   $ 	Apellidos��6Z   #��[ 6�   $��Center=�6�   $��	10,0,10,0q�6�   ��6  �� $ 	Apellidos�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5A      -   5        $ cbCorreo��5A   �   $��3��6   $��0��6+   $��3��6;   $
 True��6H   $ Correo��6Z   #��[ 6�   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Correo�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5F      -   5        $ txtClave��5F   �   $��4��6   $��1��6+   $��0��6;   $
 True��6H   $ Clave��6Z   #��[ 6�   $��Center=�6�   $
��10,0q�6�   $��38��6�   ��6  �� $ Clave�$ TwoWay=�$ PropertyChanged=�$
 True���� 5J      -   5        $ txtTelefono��5J   �   $��5��6   $��1��6+   $��1��6;   $
 True��6H   $ Telefono��6Z   #��[ 6�   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Telefono�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True��(  "System.Windows.Controls.DatePicker  5O      -   5          Name$ 	dpFechReg��5O   !   $��2��64   $��6��6A   $��1��6N   $��Center=�6^    ( $MaterialDesignFloatingHintDatePicker#��[ 6y   $ Fecha Registro��6�   $��50��6�   $��
10,0,10,15q�6�      SelectedDate 6  �� $ FechaRegistro�$ OneWay=�$
 True��$ PropertyChanged=�$
 True���� 5T      -   5        $ txtRol��5T   �   $��8��6   $��1��6+   $��3��6;   $
 True��6H    �� TextWrapping$
 Wrap=�6Z   $	 Rol��6n   #��[ 6�   $��Center=�6�   $��	10,0,10,0q�6�   ��6  �� $ 
Rol.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5Y      -   5         ��Name$ Imagen��5Y      $��2��6,   $��3��6<   $��5q�6M   $ Imagen��6X   ��6�   �� *Imagen+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5^      -   5        $ btnBuscarLibros��5^      $ Editar Foto��66   $��3��6L   $��3��6\   $	��125��6i   $��38��6u   $��Center=�6�   $��Center=�6�   #���  6�   $��0q�6.  $��0,30,0,0q�6:  $
 Hand��6c  ��6�     $	 	ImageEdit=�
 256c  5_      5`      �� 5b      -   5        $ gbFormularioDireccion��5b      $'��!Datos de la direccion del usuario��66   #���  6a   $��2��6�   $��0��6�   $��
10,0,10,10q�6�   .��5d      � -   5        $ gContenedorDireccion��5d      $
 Hand��65    5f      �� 5g      $��* �6(   �� 5h      $��* �6(    5k      �� 5l      $��* �6+   �� 5m      $��* �6+   .+�5p      �� -   5        $ txtCalle��5p   �   $��0��6   $��0��6+   $��0��68   $
 True��6H   $ Calle��6Z   #��[ 6�   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Calle�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5u      -   5        $ txtCP��5u   �   $��1��6   $��0��6+   $��1��6;   $
 True��6H   $ Codigo Postal��6Z   #��[ 6�   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ CodigoPostal�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5z      -   5        $ txtProvincia��5z   �   $��2��6   $��1��6+   $��0��6;   $
 True��6H   $ 	Provincia��6Z   #��[ 6�   $��Center=�6�   $��	10,0,10,0q�6�   ��6  �� $ 	Provincia�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5      -   5        $ 
cbConcello��5   �   $��3��6   $��1��6+   $��1��6;   $
 True��6H   $ Concello��6Z   #��[ 6�   $��Center=�6�   $��	10,0,10,0q�6�   ��6  �� $ Concello�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��5�      5�      '  !MaterialDesignThemes.Wpf.Snackbar  5�      -   5          Name$ sbNotification��5�   &   $	��Top=�5�         MessageQueue 5�      4  .MaterialDesignThemes.Wpf.MessageQueueExtension  5�      5�      5�      