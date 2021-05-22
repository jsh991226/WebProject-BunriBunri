var media = null;
var loopCountSetting=1;
var loopCount=0;
var pauseInterval=0;
var isFirstLangMode = true;
$( document ).ready(function() {
  
  $("ul.topnavbar li").click(function() {
//    alert('Top Navigation Bar was Clicked!');
    $("ul.topnavbar li").removeClass("activetopnavbar");
    $(this).addClass("activetopnavbar");
    
    $(".contentdiv").hide();
    var activeTab = $(this).attr("rel");
//    $("#" + activeTab).show();
    if(activeTab == "Practice")
      $("#Practice").show();
    else if(activeTab == "content2")
      $("#content2").show();
    else if(activeTab == "content3")
      $("#content3").show();
    else if(activeTab == "content4")
      $("#content4").show();
  });
//  $(".contentdiv").hide();
  $("#minusloop").click( function() {
      minusloop();
  });
  $("#plusloop").click( function() {
      plusloop();
  });
  $("#minusinterval").click( function() {
      minusinterval();
  });
  $("#plusinterval").click( function() {
      plusinterval();
  });
  $("#showFirstLanguage").click( function() {
      showText(0);
  });

  $("#showSecondLanguage").click( function() {
      showText(1);
  });

  $("#switchLanguage").click( function() {
      switchSound();
  });
  
  $("#firsttopnavbar").trigger("click");
  $("#prevaudio").click( function() {
      prevAudio();
  });
  $("#nextaudio").click( function() {
      nextAudio();
  });
  $("#playaudio").click( function() {
      playAudio();
  });
  $("#pauseaudio").click( function() {
      pauseAudio();
  });
  $("#stopaudio").click( function() {
      stopAudio();
  });  
});


function minusloop()
{
    if(loopCountSetting>1) {
        loopCountSetting -= 1;
        $('#loopslider').val(loopCountSetting);
//        sliderChange(2);
        $('#loopslider').slider('refresh');
    }
}
function plusloop()
{
    if(loopCountSetting<20) {
      loopCountSetting += 1;
      $('#loopslider').val(loopCountSetting);
//        sliderChange(2);
      $('#loopslider').slider('refresh');
    }
}
function minusinterval()
{
    if(pauseInterval>0) {
      pauseInterval -= 1;
      $('#intervalslider').val(pauseInterval);
//        sliderChange(3);
      $('#intervalslider').slider('refresh');
    }
}
function plusinterval()
{
    if(pauseInterval<60) {
      pauseInterval += 1;
      $('#intervalslider').val(pauseInterval);
//        sliderChange(3);
      $('#intervalslider').slider('refresh');
    }
}

var showTextBool = [0,0,1];
function showText(mode)
{
  if(mode == 0) {
    if(showTextBool[mode] == 0) {
      showTextBool[mode] = 1;
      $('#showFirstLanguage').text("Show  1st Lang.");
      $('#firstDiv').attr('style', "visibility:hidden; text-align: center;");
    } else {
      showTextBool[mode] = 0;
      $('#showFirstLanguage').text("Hide  1st Lang.");
      $('#firstDiv').attr('style', "visibility:visible; text-align: center;");
    }
  } else if(mode == 1) {
    if(showTextBool[mode] == 0) {
      showTextBool[mode] = 1;
      $('#showSecondLanguage').text("Show  2nd Lang.");
      $('#secondDiv').attr('style', "visibility:hidden; text-align: center;");
    } else {
      showTextBool[mode] = 0;
      $('#showSecondLanguage').text("Hide  2nd Lang.");
      $('#secondDiv').attr('style', "display:visibility:visible; text-align: center;");
    }
  }
}

function  switchSound()
{
    if(isFirstLangMode == true) {
        isFirstLangMode = false;
        firstText = secondOrgText;
        secondText = firstOrgText;

        document.getElementById("switchLanguage").style.background = "blue";
//        $('#switchLanguage').attr('style', "background-color:black;");
    } else {
        isFirstLangMode = true;
        firstText = firstOrgText;
        secondText = secondOrgText;
        document.getElementById("switchLanguage").style.background = "red";
    }
    $('#firsttext').text(firstText[textPosition]);
    $('#secondtext').text(secondText[textPosition]);
    $('#soundtext').text(soundText[textPosition]);
    playAudio("");
}
var media = null;
var firstText;
var secondText;
var timeMark;
var firstOrgText;
var secondOrgText;
var soundText;
var textCount=0;
var textPosition=0;
function openFiles(filename)
{
  if(media!=null)
    media.pause();
  if(playTimer!=null)
    clearTimeout(playTimer);
  playTimer=null;
//  $('#playaudiodiv').hide();
//  if(my_media!=null)
//      stopAudio();



//  is_paused = true;

  var prefix = "./" + filename + "/" + filename;
  localStorage.lastStudy = filename;
  switch(filename) {
    case 'sentence' : prefix = prefix + $('#sentence').val();
                  localStorage.lastIndex = $('#sentence').val();
                  break;
    break;
  }
  $('#sentenceDiv').load(prefix+".txt", function() {
    var temp = $('#sentenceDiv').html().split(";");
    firstOrgText = new Array();
    secondOrgText = new Array();
    soundText = new Array();
    timeMark = new Array();
    textCount = temp.length;
    textPosition = 0;
    $('#currentslider').attr("max",textCount);
    $('#currentslider').attr("min",1);
    for(var i=0; i<textCount ; i++) {
      var tt = temp[i].split("<br>");
      firstOrgText[i] = tt[0];
      secondOrgText[i] = tt[1];
      timeMark[i] = tt[2];
      soundText[i] = tt[3];
    }
    textCount --;
    firstText = firstOrgText;
    secondText = secondOrgText;
    $('#firsttext').text(firstText[0]);
    $('#secondtext').text(secondText[0]);
    $('#soundtext').text(soundText[0]);
    media = new Audio(prefix+".mp3");
  });
//
//    my_noSoundBool = false;
//    my_noVoiceBool = false;
//  maxPosition=0;
//  maxEngPosition=0;
//  engText = new Array();
//  my_timePos = new Array();
//  media.src = prefix + "sound.mp3";
//
//  getDataFile(prefix + "english.txt");
//  getDataFile(prefix + "time.txt");
//  getDataFile(prefix + "position.txt");
//  voicemedia.src = prefix + "voice.mp3";
////    alert(prefix + "english.txt");
//  $('#playaudiodiv').show();
////  $('#filename').html(prefix);
}


function sliderChange() {
  textPosition = $('#currentslider').val() - 1;
}


function prevAudio()
{
  if(textPosition>0) {
    textPosition --;
    $('#firsttext').text(firstText[textPosition]);
    $('#secondtext').text(secondText[textPosition]);
    $('#soundtext').text(soundText[textPosition]);
    $('#currentslider').val(textPosition+1);
//        sliderChange(1);
//    $('#currentslider').slider('refresh');
//    media.pause();
//    media.currentTime = parseInt(timeMark[textPosition]);
    playAudio();
  } else {
    $('#firsttext').text(firstText[textPosition]);
    $('#secondtext').text(secondText[textPosition]);
    $('#soundtext').text(soundText[textPosition]);
    $('#currentslider').val(textPosition+1);
    if(media!=null) {
      media.pause();
      media.currentTime = 0;
    }
  }
}
function nextAudio()
{
  if($('#currentslider').val()-1 != textPosition)
    textPosition = $('#currentslider').val() -1;
  if(textPosition+1<textCount) {
    textPosition ++;
    $('#firsttext').text(firstText[textPosition]);
    $('#secondtext').text(secondText[textPosition]);
    $('#soundtext').text(soundText[textPosition]);
    $('#currentslider').val(textPosition+1);
//        sliderChange(1);
//    $('#currentslider').slider('refresh');
//    media.pause();
//    media.currentTime = parseInt(timeMark[textPosition]);
    playAudio();
  } else
    stopAudio();
}
var repeatTimer=null;
var playTimer=null;
var SECOND_FOR_ONE_PLAY=2*1000;
function playAudio() {
  if(repeatTimer!=null) {
    clearInterval(repeatTimer);
    repeatTimer = null;
  }
  if(playTimer!=null)
    clearTimeout(playTimer);
  if(media!=null) {
    media.pause();
    media.currentTime = parseInt(timeMark[textPosition]);
  }
  //playTimer = setInterval("nextAudio()", (parseInt(timeMark[textPosition+1]) - parseInt(timeMark[textPosition])) * 1000);
  playTimer = setTimeout("nextAudio()", (parseInt(timeMark[textPosition+1]) - parseInt(timeMark[textPosition])) * 1000 * loopCountSetting)
  if(loopCountSetting!=1)
    repeatTimer = setInterval(function() {
        media.currentTime = parseInt(timeMark[textPosition]);
      }, (parseInt(timeMark[textPosition+1]) - parseInt(timeMark[textPosition])) * 1000);
  media.play();
}
function pauseAudio() {
  if(media!=null)
    media.pause();
  if(repeatTimer!=null) {
    clearInterval(repeatTimer);
    repeatTimer = null;
  }
  if(playTimer!=null) {
    clearTimeout(playTimer);
    playTimer=null;
  }
}
function stopAudio() {
  if(media!=null) {
    media.pause();
  }
  if(repeatTimer!=null) {
    clearInterval(repeatTimer);
    repeatTimer = null;
  }  
  if(playTimer!=null) {
    clearTimeout(playTimer);
    playTimer=null;
  }
  textPosition = 0;
  prevAudio();
}
