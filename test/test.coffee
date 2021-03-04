import spies from 'chai-spies'
import chai from 'chai'
chai.use spies

before () ->
    global.i18n = chai.spy()
    require '../source/index.coffee'

describe 'CsDizmo', () ->
    it 'should expect global.showBack to be a function', () ->
        chai.expect(global.showBack).to.be.a 'function'

    it 'should expect global.showFront to be a function', () ->
        chai.expect(global.showFront).to.be.a 'function'

describe 'CsDizmo', () ->
    it 'should expect global.i18n to be a function', () ->
        chai.expect(global.i18n).to.be.a 'function'

    it 'should expect global.i18n to have been called', () ->
        chai.expect(global.i18n).to.have.been.called()

describe 'CsDizmo', () ->
    before () ->
        global.dizmo = chai.spy.interface { subscribeToAttribute: chai.spy() }
        done = document.createElement 'button'
        done.setAttribute 'id', 'done'; document.body.append done
        document.dispatchEvent new Event('dizmoready')

    it 'should expect dizmo object to exists', () ->
        chai.expect(global.dizmo).to.exist

    it 'should expect dizmo.subscribeToAttribute to have been called', () ->
        chai.expect(global.dizmo.subscribeToAttribute).to.have.been.called()

    it 'should expect done to be an HTMLElement', () ->
        done = document.getElementById 'done'
        chai.expect(done).to.be.instanceOf HTMLElement

    it 'should expect done.onclick handler to be a function', () ->
        done = document.getElementById 'done'
        chai.expect(done.onclick).to.be.a 'function'
