require '<%= klassname.to_snake_case  %>_ui' 

# This is our Jimpanzee View code
class <%= klassname  %>View < ApplicationView
  set_java_class <%= klassname  %>Frame  # Defined in <%= klassname.downcase  %>_ui.rb

  # Signals are a way to have the controller pass requests to the view.
  # To understand Moneybars signals, see:
  #     http://www.jimpanzee.org/understanding-signals
  define_signal :name => :set_new_text , :handler => :handle_new_text

  # @load@ is called when the UI is opened.  You can think of it as a subsitute for 'initialize',
  # which, in the parent code, is already used for high-lelve preperations and should not
  # be replaced without a good understanding of how it works.
  #
  # To understand the Jimpanzee View lifecycle, see:
  #    http://www.jimpanzee.org/understanding-views
  def load
    # Helper method defined in application_view ro all views can use it
    set_frame_icon 'images/mb_default_icon_16x16.png'
    move_to_center # Built in to each Jimpanzee View class.
    # Set up some basics content for our UI ...
    default_label.text = "Jimpanzee is the bomb!"
  end

  # This is the method invoked when the view receives the set_new_text signal
  # is received.  All such signal handlers need to accept model and transfer objects.
  #
  # To understand Moneybars signals, see:
  #     http://www.jimpanzee.org/understanding-signals
  def handle_new_text(model, transfer)
    default_label.text = transfer[:new_text]
  end

  private

  def set_frame_icon file
    @main_view_component.icon_image = Java::javax::swing::ImageIcon.new(Java::org::rubyforge::roir::Main.get_resource(file)).image
  rescue Exception => e
    warn  "Error loading frame icon: #{e.message} "
    warn "Perhaps you do not have the image file '#{file}' in the proper location?"
  end



end
