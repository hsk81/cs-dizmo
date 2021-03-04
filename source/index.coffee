###*
# Shows the `#back` side of a dizmo; assignment to `global`
# enables in the dizmo menu the *settings* entry.
# @global
###
global.showBack = -> dizmo.showBack()

###*
# Shows the `#front` side of a dizmo; assignment to `global`
# enables in the dizmo menu the *content* entry.
# @global
###
global.showFront = -> dizmo.showFront()

###*
# Handler to be invoked once the translations are fetched;
# sets then the UI elements' text contents accordingly. The
# translations are in the `assets/locales` folder.
#
# @function
# @param {Error|null} error
#   Error if fetching the translations fails, otherwise null
# @param {Function} translate
#   Translator function
###
export onI18n = (error, translate) ->
    cell = document.getElementsByClassName('table-cell')[0]
    cell.textContent = translate '#front/greeting'
    done = document.getElementById 'done'
    done.textContent = translate '#back/done'
    return

global.i18n onI18n

###*
# Handler to be invoked once the dizmo is ready.
# @function
###
export onDizmoReady = ->
    dizmo.subscribeToAttribute 'settings/framecolor', () ->
        front = document.getElementById 'front'
        front.style.color = dizmo.getAdaptiveColor()
    done = document.getElementById 'done'
    done.onclick = -> dizmo.showFront()
    return

global.document.addEventListener 'dizmoready', onDizmoReady, {
    once: true
}
