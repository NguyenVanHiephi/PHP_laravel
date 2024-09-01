

const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
      const targetElement = entry.target;
      if (entry.isIntersecting) {
          targetElement.style.boxShadow = '0 -18px 4px rgba(0, 0, 0, 0.1)';
      } else {
          targetElement.style.boxShadow = 'none';
      }
  });
}, { threshold: [0, 1] });

const elementToObserve = document.querySelector('.yn6AIc');
observer.observe(elementToObserve);

window.addEventListener('scroll', () => {

  const records = observer.takeRecords();
  if (records.length > 0) {
    const isElementIntersecting = records.some(entry => entry.isIntersecting);
    const element = document.querySelector('.element');
    if (!isElementIntersecting) {
        element.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)';
    } else {
        element.style.boxShadow = 'none';
    }
}
});

    const dgh = document.getElementById('dgh');
    var itemdgh = dgh.getAttribute('data-item');

    dgh.addEventListener('click', function() {
        debugger;
        window.location.href = "?action=del&id="+itemdgh;

      });

      const checkAll = document.querySelector('[aria-label="Chọn tất cả các sản phẩm"]');

      const checkboxes = document.querySelectorAll('[aria-label="Chọn sản phẩm này"]');

      const yeucauElement = document.querySelector('.CoYXUV');
      
    checkAll.addEventListener('change', (event) => {
      checkboxes.forEach((checkbox) => {
        checkbox.checked = event.target.checked;

        tongthanhtoansl();
        tongthanhtoant();
       
      });
    });

    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', (event) => {
        if (!event.target.checked) {
          checkAll.checked = false;
        } else {
          checkAll.checked = document.querySelectorAll('.check:checked').length === checkboxes.length;
        }

        tongthanhtoansl();
        tongthanhtoant();

      });
    });

   
    function tongthanhtoant(){

      var trElements = document.getElementsByTagName('tr');
        const tong_sp = document.querySelector('.mketV9');
        var result = 0;
    
    for (var i = 0; i < trElements.length; i++) {
      debugger;
        if (trElements[i].querySelector('input[type="checkbox"]:checked')) {
            var giaElement = trElements[i].querySelector('.gia');
            const qtyElement = trElements[i].querySelector('#quantity_value');
    
            var giaText = giaElement.textContent;
            var qtyText = qtyElement.textContent;
      
            var giaValue = parseFloat(giaText.replace('$', '').trim()); // Chuyển đổi về số và loại bỏ ký tự $
            var qtyValue = parseInt(qtyText.trim()); // Chuyển đổi về số nguyên
  
             result = result + giaValue * qtyValue;
            
        }
    }
    
    tong_sp.textContent = '$' + result;

    }

    function tongthanhtoansl(){

      const selectedCheckboxes = document.querySelectorAll('[aria-label="Chọn sản phẩm này"]:checked');
        
      if (selectedCheckboxes.length > 0) {
          yeucauElement.textContent = "Tổng thanh toán ("+ selectedCheckboxes.length +" Sản phẩm):";
      } else {
          yeucauElement.textContent = "Tổng thanh toán (0 Sản phẩm):";
      }

    }

    
    const donhang = document.querySelector('.shop-button-solid--primary');

    donhang.addEventListener('click', function(){

      let anyCheckboxChecked = false;
      var selectedValues = [];

      checkboxes.forEach((checkbox) => {

        if (checkbox.checked) {
          anyCheckboxChecked = true;
          selectedValues.push(checkbox.value);
      }
       
      });

      if (anyCheckboxChecked) {
debugger;



          var form = document.createElement("form");
 form.method = "POST";
 form.action = ".";
 
 // Tạo các trường input
 var ac_Input = document.createElement("input");
 ac_Input.type = "text";
 ac_Input.name = "action";
 ac_Input.value = "dat_hang";
 
 
 var idInput = document.createElement("input");
 idInput.type = "text";
 idInput.name = "ids";
 idInput.value = selectedValues;
 
 // Thêm các trường input vào form
 form.appendChild(ac_Input);
 form.appendChild(idInput);
 
 // Thêm form vào body của trang
 document.body.appendChild(form);
 debugger;
 // Gửi form
 form.submit();
        
      } else {

        newDiv = document.createElement("div");
        
        newDiv.innerHTML= `<div id="alert" class="" style="line-height: 28px; position: fixed; top: 30px;
        right: 20px;" >
                    <div class="toastnew info">
                <i class="fa-solid fa-circle-info"></i>
                <div class="content">
                    <div class="title">Thông báo</div>
                    <span>Bạn vẫn chưa chọn sản phẩm nào để mua.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
                </div>`;
        var oldDiv = document.querySelector('.nav-outer');
        oldDiv.appendChild(newDiv);

      }

    });


  