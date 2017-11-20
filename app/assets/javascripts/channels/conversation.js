App.conversation = App.cable.subscriptions.create("ConversationChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
  
      if (data['window'] !== undefined) {
        var conversation_visible = conversation.is(':visible');
  
        if (conversation_visible) {
          var messages_visible = (conversation).find('.panel-body').is(':visible');
  
          if (!messages_visible) {
            conversation.removeClass('panel-default').addClass('panel-success');
          }
          conversation.find('.messages-list').find('ul').append(data['message']);
        }
        else {
          $('.panel-default').parent().remove();          
          $('#conversations-list').append(data['window']);
          conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
          conversation.find('.panel-body').toggle();
        }
      }
      else {
        conversation.find('ul').append(data['message']);
      }
  
      var messages_list = conversation.find('.messages-list');
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });

  // $(document).keypress('#body', function(e) {
  //   if(e.which == 13 && !e.shiftKey) {        
  //     e.preventDefault();
  //     var values = $(this).serializeArray();
  //     App.conversation.speak(values);
  //     $(this).closest("form").submit();
  //   }
  // });

  $(document).on('submit', '.new_message', function(e) {
    e.preventDefault();
    var values = $(this).serializeArray();
    App.conversation.speak(values);
    $(this).trigger('reset');
  });
  
  // $(document).keypress('#body', function(e){
  //   if (e.keyCode == 13 && !e.shiftKey)
  //   {        
  //     e.preventDefault();
  //     var values = $('.new_message').serializeArray();
  //     App.conversation.speak(values);
  //     $('.new_message').trigger('reset');
  //   }

  //   if (e.keyCode == 13 && e.shiftKey)
  //   {       
  //       //this is the shift+enter right now it does go to a new line
  //   }    
  // });