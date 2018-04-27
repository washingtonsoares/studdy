$(document).ready(function(){
    console.log(document.cookie)
    const player = new Plyr('#player')

    player.on('play', event => {
        const instance = event.detail.plyr
        console.log(instance)
    })

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