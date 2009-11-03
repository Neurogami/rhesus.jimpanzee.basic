class <%= klassname  %>Controller < ApplicationController
  set_model '<%= klassname  %>Model'
  set_view  '<%= klassname  %>View'


  def default_button_action_performed
    transfer[:new_text] = "In-line Swing classes from Ruby rulez!"
    signal :set_new_text
  end


  def about_menu_action_performed
    AboutController.instance.show
  end


  def exit_menu_action_performed
   close 
  end

end
