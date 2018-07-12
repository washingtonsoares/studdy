function buildWatchedMedia() {
    const user_id = $('nav').data('current-user')
    const learning_content_id = $('.todo-done').data('learning-content-id')
    const course_id = $("#course-container").data("course-id")

    return {
        watched_media: {
            user_id,
            course_id,
            learning_content_id
        }
    }
}

function saveWatchedMedia() {
    const watchedMedia = buildWatchedMedia()

    $.ajax({
        type: "POST",
        url: "/create-watched-media",
        data: watchedMedia
    });
}

$(document).on("turbolinks:load", function() {
    const player = new Plyr('#player')
    const timeSpent = []
    const minPercentage = 1

    function getPercentage(timeSpent) {
        var percent = 0

        for (var i=0, l = timeSpent.length; i<l; i++) {
            if (timeSpent[i]) {
                percent++
            }
        }

        percent = Math.round(percent / timeSpent.length * 100)
        if (percent > minPercentage) {
            saveWatchedMedia()
        }
    }

    player.on('play', event => {
        const instance = event.detail.plyr
        const videoDuration = Math.ceil(instance.duration)
        for (let i=0; i < videoDuration; i++) {
            timeSpent[i] = false
        }
    })

    player.on('timeupdate', event => {
        const instance = event.detail.plyr
        const currentTime = Math.ceil(instance.currentTime)
        
        if (currentTime > 0) {
            timeSpent[currentTime] = true

            getPercentage(timeSpent)
        }
    })

    $('.todo ul li:first').addClass("todo-done")


    $('.todo ul li').on('click', function(){
        const videoURL = $(this).data('video-id')

        player.source = {
            type: 'video',
            sources: [{
                src: videoURL,
                provider: 'youtube'
            }]
        }
    })
})