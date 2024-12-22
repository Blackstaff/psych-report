defmodule PsychReport.SpeechToText.Mock do
  @behaviour PsychReport.SpeechToText

  @impl true
  def transform(_audio_path) do
    {:ok,
     """
     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis mollis lorem, id feugiat neque ultrices et. Sed molestie vestibulum augue quis luctus. Praesent a luctus mi, sit amet accumsan leo. Sed tincidunt leo a viverra tincidunt. Fusce urna elit, rhoncus a leo eget, tincidunt cursus risus. Morbi purus sem, fermentum sagittis felis quis, varius vestibulum arcu. Integer eu aliquet justo, in aliquet urna. Curabitur sed venenatis nisl, eget semper diam. Ut posuere lectus ut urna hendrerit, ac imperdiet lectus egestas. Phasellus varius, sem ut tempus interdum, augue ante aliquet libero, sit amet rutrum purus felis vel magna. Morbi bibendum ante turpis, ut lacinia neque fermentum non. Proin et arcu feugiat, ornare leo vel, cursus lectus. Sed ullamcorper mattis ullamcorper. Ut sit amet orci at eros semper viverra.

     Aliquam at libero mi. Aliquam finibus erat sed tempus tristique. Suspendisse et ullamcorper ex, et blandit quam. Etiam ultricies odio quis arcu ornare, id fringilla est accumsan. Morbi efficitur sollicitudin odio, sed maximus mi accumsan sit amet. Maecenas quis sem a lacus placerat convallis. Aenean magna tellus, ultrices eu dui at, imperdiet congue velit. Morbi ac eleifend turpis. Curabitur orci diam, hendrerit in scelerisque eu, lacinia quis tortor.

     Donec eleifend velit et nulla commodo vulputate. Etiam lacinia metus enim, sit amet molestie nisi hendrerit id. Maecenas convallis blandit urna vitae facilisis. Aenean rutrum, diam non finibus rhoncus, erat arcu tempor eros, at efficitur nisi ligula at leo. Curabitur maximus tortor massa, in bibendum nibh posuere sit amet. Donec sodales velit feugiat nulla gravida finibus. Sed posuere ex sed nulla luctus, ut sodales nisi porta. Sed sed nisi metus. Sed in urna nisi. Suspendisse at libero risus. Quisque suscipit vestibulum enim, vel gravida elit rutrum varius. Nulla eleifend et tortor nec dignissim. Etiam at vestibulum sapien. Nunc a rutrum mi. Integer in lectus mi. Sed laoreet consequat nibh, a varius metus cursus ut.

     Aenean convallis orci sed felis ultrices vehicula. Curabitur quis nisi at nunc congue ultrices. Nullam non ultrices nisi. Nunc consequat pharetra velit, vitae mattis lacus rhoncus at. Aenean eleifend magna id sapien aliquet cursus. Nulla vestibulum ornare leo non scelerisque. Nulla efficitur placerat felis vitae aliquam. Ut mollis augue metus, id scelerisque mi mollis a. Sed maximus lectus id tellus pulvinar, quis accumsan enim euismod. In dignissim sem eget elementum molestie.

     Vivamus scelerisque gravida lorem, a semper mauris tristique sed. Curabitur malesuada eros lorem, non viverra lacus pretium non. Nulla vehicula et purus et semper. Curabitur ultricies varius tellus, a malesuada dolor facilisis nec. Quisque placerat iaculis odio quis elementum. Sed gravida, urna porta ultrices faucibus, mi risus suscipit mi, maximus aliquam risus nibh sit amet libero. Nulla cursus nisl massa, ut molestie sem vestibulum nec. Quisque a aliquet arcu. Donec molestie justo eu nisl convallis scelerisque. Morbi convallis ex suscipit sapien accumsan, non laoreet nibh vestibulum. Nam dapibus libero ac mi viverra pharetra. Aenean in tempus nisi. Sed venenatis nibh eget placerat vestibulum. 
     """}
  end
end
