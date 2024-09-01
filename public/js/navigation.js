

    // đăng ký 
        const register = document.getElementById('register');

        register.addEventListener('click', function(event) {

            event.preventDefault();

            var url = window.location.href;

            const lastIndex = url.lastIndexOf("productmng");

            // Kiểm tra nếu chuỗi "productmng" tồn tại trong URL
        
            const substringAfterProductmng = url.substring(lastIndex + "productmng".length); 
            const numOfSlashes = (substringAfterProductmng.match(/\/(?!$|\?)/g) || []).length;debugger;
            var action = "";
            if(numOfSlashes === 0){
                action = "./login/";
            }else if(numOfSlashes === 1){
                action = "../login/";
            }else if(numOfSlashes === 2){
                action = "../../login/";
            }else if(numOfSlashes === 3){
                action = "../../../login/";
            }
            
            
            
            var form = document.createElement("form");
            form.method = "POST";
            form.action = action;
            
            // Tạo các trường input
            var a_Input = document.createElement("input");
            a_Input.type = "text";
            a_Input.name = "action";
            a_Input.value = "register_form";
            
            
            // Thêm các trường input vào form
            form.appendChild(a_Input);
            
            // Thêm form vào body của trang
            document.body.appendChild(form);
            debugger;
            // Gửi form
            form.submit();
            
          });

    /////////////

    // search 

          
    var search = document.querySelector(".search-button");
    
    

    search.addEventListener('click', function(event) {

        event.preventDefault();

        var url = window.location.href;

        const lastIndex = url.lastIndexOf("productmng");

        // Kiểm tra nếu chuỗi "productmng" tồn tại trong URL
        
            const substringAfterProductmng = url.substring(lastIndex + "productmng".length); 
            const numOfSlashes = (substringAfterProductmng.match(/\/(?!$|\?)/g) || []).length;debugger;
            var action = "";
            if(numOfSlashes === 0){
                action = "./search/";
            }else if(numOfSlashes === 1){
                action = "../search/";
            }else if(numOfSlashes === 2){
                action = "../../search/";
            }else if(numOfSlashes === 3){
                action = "../../../search/";
            }

        var search_input = document.querySelector(".search-field");
        var text_search = search_input.value;
        
        
        var form = document.createElement("form");
        form.method = "GET";
        form.action = action;
        
        // Tạo các trường input
        var a_Input = document.createElement("input");
        a_Input.type = "text";
        a_Input.name = "key";
        a_Input.value = text_search;
        
        
        // Thêm các trường input vào form
        form.appendChild(a_Input);
        
        // Thêm form vào body của trang
        document.body.appendChild(form);
        debugger;
        // Gửi form
        form.submit();
        
      });
    


