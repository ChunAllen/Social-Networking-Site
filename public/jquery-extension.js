 <script>
            $(".demo").collapse({show: function(){
                    this.animate({
                        opacity: 'toggle', 
                        height: 'toggle'
                    }, 300);
                },
                hide : function() {
                    
                    this.animate({
                        opacity: 'toggle', 
                        height: 'toggle'
                    }, 300);
                }
            });
            $(".demo-2").collapse({hide: function() {
                this.fadeOut();
            }});
        </script>