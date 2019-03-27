# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
    editor = new Simditor(
        textarea: $('#article_content')
        toolbar: [ 'bold', 'italic', 'underline', 'strikethrough', 'color',
            'code', 'blockquote', 'link', 'image', 'ol', 'ul', 'table', 'indent','outdent','alignment']
        pasteImage: true,
        fileKey: 'file',
        upload: {
            url: '/images/upload',
            fileKey: 'image',
            params: {"content":"image"},
            connectionCount: 3,
            leaveConfirm: '有图片正在上传，确定要离开?'
    })
