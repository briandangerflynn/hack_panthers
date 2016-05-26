== README


# Hack Panthers

### Synopsis
Homeo is a user-friendly video based app that allows users to
post and review videos. Owners of rooms can take a quick video of the space available along with a brief descriptive video of themselves. Potential renters can also post a profile video of
themselves while they review all the available rooms that an owner has to offer and they can also get video preview of their possible future roommate.

### Ziggeo API
Homeo is powered with the Ziggeo API for video playback and record. The recorder/player is embedded with a few lines of code.  The
player code is included within HTML “<ziggeo>” tags:

> <ziggeo ziggeo-video=<%= var_of_video_to_play %>
>>>>>>>>> ziggeo-width=320
>>>>>>>>> ziggeo-height=240>
> </ziggeo>

> as well as jQuery to activate the recorder:

> <script>
>>>>>>>> $("#record").on("click", function () {
>>>>>>>> console.log("button works")
>>>>>>>> popup = ZiggeoApi.Embed.popup({
>>>>>>>>>>> width: 450,
>>>>>>>>>>> height: 280,
>>>>>>>>>>> limit: 120
>>>>>>>> });
>>>> });
> </script>

#### Homeo, LLC was founded and orchestrated by:
- Ralph Acevedo (github handle: RalphJulien)
- Rashish Paul (gitbub handle: rashishpaul)
- Yuna Kim (github handle: ykim632)
- Brian “Danger” Flynn (github handle: briandangerflynn)

### References
> Trello: (https://trello.com/b/jrvbsVnB/hack-panthers)






