@extends('layouts.app')

@section('content')

<!-- ============================================== HEADER : END ============================================== -->
<div class="body-content">
	<div class="container">
		<div class="track-order-page">
			<div class="row">
				<div class="col-md-12"> 
                <h1 >Thông tin kho sản phẩm</h1>
    <aside>
            <h2 class="heading-title">Loại sản phẩm</h2>
            <nav>
                <ul>
                   
                </ul>
            </nav>
        </aside>
        <section>
        <h2 class="heading-title">
            
        </h2>
        <section class="content-header" id="form">
</section>
        <table class="table compare-table inner-top-vs">
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Nhà sản xuất</th>
                    <th>Giá sản phẩm</th>
                    <th>Ảnh</th>
                    <th>&nbsp;</th>
                </tr>
                <tbody id="dataBody">
                 
                 
                 </tbody>
                
            </table>
            <ul class="pagination" id="pagination" >
      <!-- Nút phân trang sẽ được thêm vào đây bằng JavaScript -->


       
    </section>
</div>			</div><!-- /.row -->
<p class="last_paragraph">
            <a onclick="Add('add','0')" class="btn-upper btn btn-primary checkout-page-button add">Thêm sản phẩm</a>
        </p>
        <p class="last_paragraph">
            <a href="?action=xem_danh_muc_sp" class="btn-upper btn btn-primary checkout-page-button">Thêm loại sản phẩm</a>
        </p>
		</div><!-- /.sigin-in-->
		<!-- ============================================== BRANDS CAROUSEL ============================================== -->

<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div>

<script>

let newDiv = null;


fetch('/get-data')
  .then(response => response.json())
  .then(data => {
    var recordsPerPage = 3;
    var currentPage = getPageFromURL() || 1;

    function displayData(datas) {
      var startIndex = (currentPage - 1) * recordsPerPage;
      var endIndex = startIndex + recordsPerPage;
      var currentData = datas.slice(startIndex, endIndex);

      var tableBody = $("#dataBody");
      tableBody.empty();

      $.each(currentData, function(index, record) {
        var row = $("<tr>");
        row.html(`
          <td>${record.ten_sp}</td>
          <td>${record.Nsx}</td>
          <td>${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(record.Gia_sp)}</td>
          <td>
            <div class="product_image">
              <img width="200px" display="inline-block" src="{{ asset('storage/${record.image}')}}" alt="">
            </div>
          </td>
          <td>
            <input onclick="Add('up','${record.ID_sp}')" class="btn-upper btn btn-primary checkout-page-button" type="submit" value="Sửa SP">
            <br><br>
            <form action="/products/${record.ID_sp}" method="POST">
              @csrf
              @method('DELETE')
              <input class="btn-upper btn btn-primary checkout-page-button" type="submit" style="background:red;" value="Xoá SP">
            </form>
          </td>`);
        tableBody.append(row);
      });
    }

    function renderPagination(datas) {
      var totalPages = Math.ceil(datas.length / recordsPerPage);
      var pagination = $("#pagination");
      pagination.empty();

      // Add "Previous" button
      var prevButton = $("<li>").addClass("page-item");
      prevButton.html("<a class='page-link a' href='javascript:void(0);'><</a>");
      if (currentPage === 1) {
        prevButton.addClass("disabled");
      } else {
        prevButton.on("click", function() {
          currentPage--;
          updateURLWithPage(currentPage);
          displayData(datas);
          renderPagination(datas);
        });
      }
      pagination.append(prevButton);

      // Add page numbers
      for (var i = 1; i <= totalPages; i++) {
        var button = $("<li>");
        button.addClass("page-item");
        if (i === currentPage) {
          button.addClass("active");
          button.html("<a class='page-link' href='javascript:void(0);' style='background-color: #007bff; color: white;'>" + i + "</a>");
        } else {
          button.html("<a class='page-link' href='javascript:void(0);'>" + i + "</a>");
          button.on("click", function() {
            currentPage = parseInt($(this).text());
            updateURLWithPage(currentPage);
            displayData(datas);
            renderPagination(datas);
          });
        }
        pagination.append(button);
      }

      // Add "Next" button
      var nextButton = $("<li>").addClass("page-item");
      nextButton.html("<a class='page-link a' href='javascript:void(0);'>></a>");
      if (currentPage === totalPages) {
        nextButton.addClass("disabled");
      } else {
        nextButton.on("click", function() {
          currentPage++;
          updateURLWithPage(currentPage);
          displayData(datas);
          renderPagination(datas);
        });
      }
      pagination.append(nextButton);
    }

    function getPageFromURL() {
      var params = new URLSearchParams(window.location.search);
      return parseInt(params.get('page'));
    }

    function updateURLWithPage(page) {
      var params = new URLSearchParams(window.location.search);
      params.set('page', page);
      window.history.replaceState({}, '', `${window.location.pathname}?${params}`);
    }

    displayData(data.products);
    renderPagination(data.products);
  })
  .catch(error => {
    console.error('Error:', error);
  });


    



  async function Add(sk,i) {
    
    let method = '';
    let name_form = '' ;
    let id_sp = '' ;
    let name_sp = '' ;
    let type_sp = '' ;
    let gia_sp = '' ;
    let nsx = '' ;
    let img = '';
    let img_sp = [];
    let bt = '' ;
    let action = '/products';
    let option =[];
    let option1 = [];
    
 
 if (newDiv !== null) {
    newDiv.remove();
  }
 debugger;
 if(sk==='add'){
     
     var add = document.querySelector(".add");
     add.style.display = "none";
     name_form='Form thêm mới sản phẩm ';
     bt = 'Thêm' ;
     try {
  
        const response1 = await fetch(`get_cate`);
        const data1 = await response1.json();
        data1.forEach(category => {
          option.push({ value: category.ID_loai_sp, text: category.Loai_sp }); // assuming 'id' and 'name' are fields in your Category model
        });

        const response2 = await fetch(`get_supplier`);
        const data2 = await response2.json();
        data2.forEach(supplier => {
          option1.push({ value: supplier.ID_Ncc, text: supplier.Ten_Ncc }); // assuming
        });
        
    } catch (error) {
        console.error('Error:', error);
    }
     
 }else if(sk==='up'){
     
     bt_add();
     name_form ='Form chỉnh sửa sản phẩm ';
     bt = 'Sửa' ;
     try {
        const response = await fetch(`get-data_id/${i}`);
        const data = await response.json();
        if (data.message !== 'Data not found') {
            const jsonData = data.product;
            id_sp = jsonData.ID_sp;
            name_sp = jsonData.ten_sp;
            type_sp = jsonData.ID_loai_sp;
            gia_sp = jsonData.Gia_sp;
            nsx = jsonData.Nsx;
            img = jsonData.image;
            img_sp = jsonData.all_image;
            action = '/products/'+ id_sp;
            method = `@method('PUT')`
        }
        const response1 = await fetch(`get_cate`);
        const data1 = await response1.json();
        data1.forEach(category => {
          option.push({ value: category.ID_loai_sp, text: category.Loai_sp }); // assuming 'id' and 'name' are fields in your Category model
        });

        const response2 = await fetch(`get_supplier`);
        const data2 = await response2.json();
        data2.forEach(supplier => {
          option1.push({ value: supplier.ID_Ncc, text: supplier.Ten_Ncc }); // assuming
        });
        
    } catch (error) {
        console.error('Error:', error);
    }
     
  }
 
 // tạo nội dung cần thiết
  newDiv = document.createElement("div");

  
    newDiv.innerHTML = generateForm({
    nameForm: name_form,
    action: action,
    csrf: `@csrf`, 
    method: method,
    id: id_sp,
    bt: bt,
    fields: [
        { type: 'text', label: 'Tên sản phẩm', name: 'name', placeholder: 'Enter ...', value: name_sp },
        {
            type: 'select',
            id: 'loai_sp',
            label: 'Loại sản phẩm',
            name: 'loai',
            options: [
                { value: '0', text: 'Mời chọn loại sản phẩm', selected: true },
                ...option 
            ]
        },
        { type: 'text', label: 'Giá sản phẩm', name: 'gia', placeholder: 'Enter ...', value: gia_sp },
        {
            type: 'select',
            id: 'ncc',
            label: 'Nhà sản xuất',
            name: 'nsx',
            options: [
                { value: '0', text: 'Mời chọn nhà cung cấp', selected: true },
                ...option1
            ]
        },
        {
            type: 'file',
            label: 'Chọn ảnh cho sản phẩm',
            name: 'image',
            id: 'imageFile',
            value: img_sp,
            image:img
        }
    ]
});


       debugger;
       // Đè thẻ div mới lên thẻ div cũ 
var oldDiv = document.getElementById("form");
oldDiv.appendChild(newDiv);

if(type_sp!==""){
document.getElementById('loai_sp').value = type_sp;
}

if(nsx!==""){
document.getElementById('ncc').value = nsx;
}

initializeSelect2();
        
}




function bt_add(){
   
    var add = document.querySelector(".add");
    add.style.display = "";
   
}



</script>
@endsection

