document.addEventListener('turbo:load', () => {
  const form = document.getElementById('multi-step-form');
  const steps = Array.from(form.querySelectorAll('.step'));
  let currentStep = 0;

  function showStep(step) {
    steps.forEach((stepElement, index) => {
      stepElement.style.display = index === step ? 'block' : 'none';
    });
  }

  function validateStep(step) {
    let isValid = true;

    if (step === 0) {
      // Step 1 validation
      const title = document.getElementById('title').value;
      if (!title) {
        document.getElementById('title-error').textContent = 'Title is required.';
        isValid = false;
      } else {
        document.getElementById('title-error').textContent = '';
      }
    }
  
    if (step === 1) {
      // Step 2 validation
      const description = document.getElementById('description').value;
      if (!description) {
        document.getElementById('description-error').textContent = 'Description is required.';
        isValid = false;
      } else {
        document.getElementById('description-error').textContent = '';
      }
    }
  
    if (step === 2) {
      // Step 3 validation
      const price = document.getElementById('price').value;
      if (!price) {
        document.getElementById('price-error').textContent = 'Price is required.';
        isValid = false;
      } else {
        document.getElementById('price-error').textContent = '';
      }
    }
  
    if (step === 3) {
      // Step 4 validation
      const totalQuantity = document.getElementById('total_quantity').value;
      if (!totalQuantity) {
        document.getElementById('total_quantity-error').textContent = 'Total Quantity is required.';
        isValid = false;
      } else {
        document.getElementById('total_quantity-error').textContent = '';
      }
    }
  
    if (step === 4) {
      // Step 5 validation
      const quantityInStock = document.getElementById('quantity_in_stock').value;
      if (!quantityInStock) {
        document.getElementById('quantity_in_stock-error').textContent = 'Quantity in Stock is required.';
        isValid = false;
      } else {
        document.getElementById('quantity_in_stock-error').textContent = '';
      }
    }
  
    // Add more steps and their validation as needed.
  
    return isValid;
  
  }

  // Handle "Next" button clicks
  function handleNextClick() {
    if (validateStep(currentStep)) {
      currentStep++;
      showStep(currentStep);
    }
  }

  // Handle "Previous" button clicks
  function handlePreviousClick() {
    currentStep--;
    showStep(currentStep);
  }

  // Add event listeners to the "Next" and "Previous" buttons for each step
  for (let i = 1; i <= steps.length; i++) {
    const nextBtn = document.getElementById(`next-btn-${i}`);
    const prevBtn = document.getElementById(`prev-btn-${i}`);

    if (nextBtn) {
      nextBtn.addEventListener('click', handleNextClick);
    }

    if (prevBtn) {
      prevBtn.addEventListener('click', handlePreviousClick);
    }
  }

  showStep(currentStep);
});
