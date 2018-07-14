$(function() 
{  
  function paramSlider(curr_val) 
  {
    avail_values = [5,15,30]
    return avail_values[curr_val-1];
  }
  
  $("#param").ionRangeSlider(
  {
    prettify: paramSlider,
  });
  
  
  
  
  function thetaSlider(curr_val) 
  {
    avail_values = [0.2,0.5,0.6,1]
    return avail_values[curr_val-1];
  }
  
  $("#theta").ionRangeSlider(
  {
    prettify: thetaSlider,
  });
  
  
  
  function iterSlider(curr_val) 
  {
    avail_values = [1000,2000,3000]
    return avail_values[curr_val-1];
  }
  
  $("#iterations").ionRangeSlider(
  {
    prettify: iterSlider,
  });
  
  
  
  
  function perpSlider(curr_val) 
  {
    avail_values = [50,100,150,200]
    return avail_values[curr_val-1];
  }
  
  $("#perplexity").ionRangeSlider(
  {
    prettify: perpSlider,
  });
})