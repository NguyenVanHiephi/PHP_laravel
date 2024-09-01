              
              
let imageIndex = 1;

//form create 
function generateForm({ nameForm, action, csrf, method, bt, fields }) {debugger;
    let formFields = '';
    let rowOpen = false;
    imageIndex = 1;

    fields.forEach((field, index) => {
        if (index % 2 === 0) {
            // Close the previous row if open
            if (rowOpen) {
                formFields += `</div>`;
            }
            // Open a new row
            formFields += `<div class="row">`;
            rowOpen = true;
        }

        let fieldHtml = '';

        if (field.type === 'select') {
            fieldHtml = `
            <div class="col-sm-6">
                <div class="form-group">
                    <label>${field.label}</label>
                    <select class="form-control select2" name="${field.name}" id="${field.id}">
                        ${field.options.map(option => `
                            <option value="${option.value}" ${option.selected ? 'selected' : ''}>${option.text}</option>
                        `).join('')}
                    </select>
                </div>
            </div>`;
        } else if (field.type === 'textarea') {
            fieldHtml = `
            <div class="col-sm-6">
                <div class="form-group">
                    <label>${field.label}</label>
                    <textarea class="form-control" name="${field.name}" placeholder="${field.placeholder}">${field.value}</textarea>
                </div>
            </div>`;
        } else if (field.type === 'file' && field.name === 'image') {
            if(field.image!==''){
                field.image = `storage/${field.image}`;
            }
            let imageFramesHtml = `
                <div class="image-frame" onclick="selectImage(1)">
                    <img id="image1" src="${field.image}" alt="Click to add an image">
                    <input name="${field.name}1" type="${field.type}" id="${field.id}1" accept="image/*" style="display:none;" onchange="previewImage(event, 1)" multiple>
                </div>`;
            // Assuming field.value is an array of image URLs
            field.value.forEach((imageSrc, index) => {
                imageFramesHtml += `
                    <div class="image-frame" onclick="selectImage(${index + 2})">
                    <span class="close-button" onclick="removeImageFrame(${index + 2}); event.stopPropagation();">✕</span>
                    <img id="image${index + 2}" src="storage/${imageSrc.Images}" alt="Click to add an image">
                    <input name="${field.name}${index + 2}" type="${field.type}" id="${field.id}${index + 2}" accept="image/*" style="display:none;" onchange="previewImage(event, ${index + 2})">
                    <input type="hidden" name="id_image${index + 2}" value="${imageSrc.id}">
                </div>`;
                imageIndex = index+2;
            });

            fieldHtml = `
            <div class="col-sm-6">
                <div class="form-group">
                    <label>${field.label}</label>
                    <div id="image-container">
                        ${imageFramesHtml}
                    </div>
                    <br>
                    <ol class="float-sm-right">
                        <span class="btn btn-block btn-danger btn-sm" id="add-image-frame" onclick="addImageFrame()">Thêm ảnh mô tả</span>
                    </ol>
                </div>
            </div>`;
        } else {
            fieldHtml = `
            <div class="col-sm-6">
                <div class="form-group">
                    <label>${field.label}</label>
                    <input type="${field.type}" class="form-control" name="${field.name}" placeholder="${field.placeholder}" value="${field.value}">
                </div>
            </div>`;
        }

        formFields += fieldHtml;

        if (index === fields.length - 1) {
            // Close the row if it's the end of the pair or the end of the fields
            formFields += `</div>`;
            rowOpen = false;
        }
    });

    return `
    <section class="content">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">${nameForm}</h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Sụp đổ">
                        <i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" onclick="bt_add()" data-card-widget="remove" title="Di dời">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <form action="${action}" method="POST" enctype="multipart/form-data">
                    ${csrf}
                    ${method}
                    ${formFields}
                    <div class="col-sm-6-left">
                        <br>
                        <ol class="float-sm-right">
                            <button type="submit" class="btn btn-block btn-danger btn-sm">${bt}</button>
                        </ol>
                    </div>            
                </form>
            </div>
        </div>
    </section>`;
}


// chọn ảnh và hiện thị 
function selectImage(index) {
    document.getElementById(`imageFile${index}`).click();
}

function previewImage(event, index) {
    const reader = new FileReader();
    reader.onload = function() {
        const img = document.getElementById(`image${index}`);
        img.src = reader.result;

        // Hide the + sign once an image is selected
        img.style.display = 'block';
        img.parentNode.classList.add('has-image');
    }
    reader.readAsDataURL(event.target.files[0]);
}


function addImageFrame() {

    imageIndex++;
    debugger;
      const container = document.getElementById('image-container');
  
      const newFrame = document.createElement('div');
      newFrame.className = 'image-frame';
      newFrame.setAttribute('onclick', `selectImage(${imageIndex})`);
  
      const newImg = document.createElement('img');
      newImg.id = `image${imageIndex}`;
      newImg.src = '';
  
      const newInput = document.createElement('input');
      newInput.name = `image${imageIndex}`;
      newInput.type = 'file';
      newInput.id = `imageFile${imageIndex}`;
      newInput.accept = 'image/*';
      newInput.style.display = 'none';
      newInput.setAttribute('onchange', `previewImage(event, ${imageIndex})`);
  
      const closeButton = document.createElement('span');
      closeButton.innerHTML = '✕';
      closeButton.className = 'close-button';
      closeButton.setAttribute('onclick', `removeImageFrame(${imageIndex}); event.stopPropagation()`);
  
      newFrame.appendChild(closeButton);
      newFrame.appendChild(newImg);
      newFrame.appendChild(newInput);
      container.appendChild(newFrame);
    
      
  }
  
  function removeImageFrame(imageId) {debugger;
      const frameToRemove = document.querySelector(`.image-frame img[id="image${imageId}"]`).parentNode;
      frameToRemove.remove();
  }
  
