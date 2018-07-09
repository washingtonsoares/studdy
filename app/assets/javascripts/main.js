$(document).on("turbolinks:load", function() {
    const player = new Plyr('#player')
    const timeSpent = []
    const minPercentage = 50

    function getPercentage(timeSpent) {
        var percent = 0

        for (var i=0, l = timeSpent.length; i<l; i++) {
            if (timeSpent[i]) {
                percent++
            }
        }

        percent = Math.round(percent / timeSpent.length * 100)

        if (percent > minPercentage) {
            alert('50%')
        }
    }


    function updateURL(videoID) {
        if (history.pushState) {
            const newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?video=' + videoID
            window.history.pushState({ path: newurl }, '', newurl)
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
        timeSpent[Math.ceil(instance.currentTime)] = true

        getPercentage(timeSpent)
    })

    $('.todo ul li:first').addClass("todo-done")

    $('.todo ul li').on('click', function(){
        const videoURL = $(this).data('video-id')
        const contentID = $(this).data('learning-content-id')

        updateURL(contentID)

        player.source = {
            type: 'video',
            sources: [{
                src: videoURL,
                provider: 'youtube'
            }]
        }
    })
})