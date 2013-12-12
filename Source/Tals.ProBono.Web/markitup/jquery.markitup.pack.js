// ----------------------------------------------------------------------------
// markItUp! Universal MarkUp Engine, JQuery plugin
// v 1.1.5
// Dual licensed under the MIT and GPL licenses.
// ----------------------------------------------------------------------------
// Copyright (C) 2007-2008 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------
(function ($) {
    $.fn.markItUp = function (f, g) {
        var k, ctrlKey, shiftKey, altKey;
        ctrlKey = shiftKey = altKey = false;
        k = {
            id: '',
            nameSpace: '',
            root: '',
            previewInWindow: '',
            previewAutoRefresh: true,
            previewPosition: 'after',
            previewTemplatePath: '~/templates/preview.html',
            previewParserPath: '',
            previewParserVar: 'data',
            resizeHandle: true,
            beforeInsert: '',
            afterInsert: '',
            onEnter: {},
            onShiftEnter: {},
            onCtrlEnter: {},
            onTab: {},
            markupSet: [{}]
        };
        $.extend(k, f, g);
        if (!k.root) {
            $('script').each(function (a, b) {
                miuScript = $(b).get(0).src.match(/(.*)jquery\.markitup(\.pack)?\.js$/);
                if (miuScript !== null) {
                    k.root = miuScript[1]
                }
            })
        }
        return this.each(function () {
            var d, textarea, levels, scrollPosition, caretPosition, caretOffset, clicked, hash, header, footer, previewWindow, template, iFrame, abort;
            d = $(this);
            textarea = this;
            levels = [];
            abort = false;
            scrollPosition = caretPosition = 0;
            caretOffset = -1;
            k.previewParserPath = localize(k.previewParserPath);
            k.previewTemplatePath = localize(k.previewTemplatePath);

            function localize(a, b) {
                if (b) {
                    return a.replace(/("|')~\//g, "$1" + k.root)
                }
                return a.replace(/^~\//, k.root)
            }
            function init() {
                id = '';
                nameSpace = '';
                if (k.id) {
                    id = 'id="' + k.id + '"'
                } else if (d.attr("id")) {
                    id = 'id="markItUp' + (d.attr("id").substr(0, 1).toUpperCase()) + (d.attr("id").substr(1)) + '"'
                }
                if (k.nameSpace) {
                    nameSpace = 'class="' + k.nameSpace + '"'
                }
                d.wrap('<div ' + nameSpace + '></div>');
                d.wrap('<div ' + id + ' class="markItUp"></div>');
                d.wrap('<div class="markItUpContainer"></div>');
                d.addClass("markItUpEditor");
                header = $('<div class="markItUpHeader"></div>').insertBefore(d);
                $(dropMenus(k.markupSet)).appendTo(header);
                footer = $('<div class="markItUpFooter"></div>').insertAfter(d);
                if (k.resizeHandle === true && $.browser.safari !== true) {
                    resizeHandle = $('<div class="markItUpResizeHandle"></div>').insertAfter(d).bind("mousedown", function (e) {
                        var h = d.height(),
                            y = e.clientY,
                            mouseMove, mouseUp;
                        mouseMove = function (e) {
                            d.css("height", Math.max(20, e.clientY + h - y) + "px");
                            return false
                        };
                        mouseUp = function (e) {
                            $("html").unbind("mousemove", mouseMove).unbind("mouseup", mouseUp);
                            return false
                        };
                        $("html").bind("mousemove", mouseMove).bind("mouseup", mouseUp)
                    });
                    footer.append(resizeHandle)
                }
                d.keydown(keyPressed).keyup(keyPressed);
                d.bind("insertion", function (e, a) {
                    if (a.target !== false) {
                        get()
                    }
                    if (textarea === $.markItUp.focused) {
                        markup(a)
                    }
                });
                d.focus(function () {
                    $.markItUp.focused = this
                })
            }
            function dropMenus(b) {
                var c = $('<ul></ul>'),
                    i = 0;
                $('li:hover > ul', c).css('display', 'block');
                $.each(b, function () {
                    var a = this,
                        t = '',
                        title, li, j;
                    title = (a.key) ? (a.name || '') + ' [Ctrl+' + a.key + ']' : (a.name || '');
                    key = (a.key) ? 'accesskey="' + a.key + '"' : '';
                    if (a.separator) {
                        li = $('<li class="markItUpSeparator">' + (a.separator || '') + '</li>').appendTo(c)
                    } else {
                        i++;
                        for (j = levels.length - 1; j >= 0; j--) {
                            t += levels[j] + "-"
                        }
                        li = $('<li class="markItUpButton markItUpButton' + t + (i) + ' ' + (a.className || '') + '"><a href="" ' + key + ' title="' + title + '">' + (a.name || '') + '</a></li>').bind("contextmenu", function () {
                            return false
                        }).click(function () {
                            return false
                        }).mouseup(function () {
                            if (a.call) {
                                eval(a.call)()
                            }
                            markup(a);
                            return false
                        }).hover(function () {
                            $('> ul', this).show();
                            $(document).one('click', function () {
                                $('ul ul', header).hide()
                            })
                        }, function () {
                            $('> ul', this).hide()
                        }).appendTo(c);
                        if (a.dropMenu) {
                            levels.push(i);
                            $(li).addClass('markItUpDropMenu').append(dropMenus(a.dropMenu))
                        }
                    }
                });
                levels.pop();
                return c
            }
            function magicMarkups(c) {
                if (c) {
                    c = c.toString();
                    c = c.replace(/\(\!\(([\s\S]*?)\)\!\)/g, function (x, a) {
                        var b = a.split('|!|');
                        if (altKey === true) {
                            return (b[1] !== undefined) ? b[1] : b[0]
                        } else {
                            return (b[1] === undefined) ? "" : b[0]
                        }
                    });
                    c = c.replace(/\[\!\[([\s\S]*?)\]\!\]/g, function (x, a) {
                        var b = a.split(':!:');
                        if (abort === true) {
                            return false
                        }
                        value = prompt(b[0], (b[1]) ? b[1] : '');
                        if (value === null) {
                            abort = true
                        }
                        return value
                    });
                    return c
                }
                return ""
            }
            function prepare(a) {
                if ($.isFunction(a)) {
                    a = a(hash)
                }
                return magicMarkups(a)
            }
            function build(a) {
                openWith = prepare(clicked.openWith);
                placeHolder = prepare(clicked.placeHolder);
                replaceWith = prepare(clicked.replaceWith);
                closeWith = prepare(clicked.closeWith);
                if (replaceWith !== "") {
                    block = openWith + replaceWith + closeWith
                } else if (selection === '' && placeHolder !== '') {
                    block = openWith + placeHolder + closeWith
                } else {
                    block = openWith + (a || selection) + closeWith
                }
                return {
                    block: block,
                    openWith: openWith,
                    replaceWith: replaceWith,
                    placeHolder: placeHolder,
                    closeWith: closeWith
                }
            }
            function markup(a) {
                var b, j, n, i;
                hash = clicked = a;
                get();
                $.extend(hash, {
                    line: "",
                    root: k.root,
                    textarea: textarea,
                    selection: (selection || ''),
                    caretPosition: caretPosition,
                    ctrlKey: ctrlKey,
                    shiftKey: shiftKey,
                    altKey: altKey
                });
                prepare(k.beforeInsert);
                prepare(clicked.beforeInsert);
                if (ctrlKey === true && shiftKey === true) {
                    prepare(clicked.beforeMultiInsert)
                }
                $.extend(hash, {
                    line: 1
                });
                if (ctrlKey === true && shiftKey === true) {
                    lines = selection.split(/\r?\n/);
                    for (j = 0, n = lines.length, i = 0; i < n; i++) {
                        if ($.trim(lines[i]) !== '') {
                            $.extend(hash, {
                                line: ++j,
                                selection: lines[i]
                            });
                            lines[i] = build(lines[i]).block
                        } else {
                            lines[i] = ""
                        }
                    }
                    string = {
                        block: lines.join('\n')
                    };
                    start = caretPosition;
                    b = string.block.length + (($.browser.opera) ? n : 0)
                } else if (ctrlKey === true) {
                    string = build(selection);
                    start = caretPosition + string.openWith.length;
                    b = string.block.length - string.openWith.length - string.closeWith.length;
                    b -= fixIeBug(string.block)
                } else if (shiftKey === true) {
                    string = build(selection);
                    start = caretPosition;
                    b = string.block.length;
                    b -= fixIeBug(string.block)
                } else {
                    string = build(selection);
                    start = caretPosition + string.block.length;
                    b = 0;
                    start -= fixIeBug(string.block)
                }
                if ((selection === '' && string.replaceWith === '')) {
                    caretOffset += fixOperaBug(string.block);
                    start = caretPosition + string.openWith.length;
                    b = string.block.length - string.openWith.length - string.closeWith.length;
                    caretOffset = d.val().substring(caretPosition, d.val().length).length;
                    caretOffset -= fixOperaBug(d.val().substring(0, caretPosition))
                }
                $.extend(hash, {
                    caretPosition: caretPosition,
                    scrollPosition: scrollPosition
                });
                if (string.block !== selection && abort === false) {
                    insert(string.block);
                    set(start, b)
                } else {
                    caretOffset = -1
                }
                get();
                $.extend(hash, {
                    line: '',
                    selection: selection
                });
                if (ctrlKey === true && shiftKey === true) {
                    prepare(clicked.afterMultiInsert)
                }
                prepare(clicked.afterInsert);
                prepare(k.afterInsert);
                if (previewWindow && k.previewAutoRefresh) {
                    refreshPreview()
                }
                shiftKey = altKey = ctrlKey = abort = false
            }
            function fixOperaBug(a) {
                if ($.browser.opera) {
                    return a.length - a.replace(/\n*/g, '').length
                }
                return 0
            }
            function fixIeBug(a) {
                if ($.browser.msie) {
                    return a.length - a.replace(/\r*/g, '').length
                }
                return 0
            }
            function insert(a) {
                if (document.selection) {
                    var b = document.selection.createRange();
                    b.text = a
                } else {
                    d.val(d.val().substring(0, caretPosition) + a + d.val().substring(caretPosition + selection.length, d.val().length))
                }
            }
            function set(a, b) {
                if (textarea.createTextRange) {
                    if ($.browser.opera && $.browser.version >= 9.5 && b == 0) {
                        return false
                    }
                    range = textarea.createTextRange();
                    range.collapse(true);
                    range.moveStart('character', a);
                    range.moveEnd('character', b);
                    range.select()
                } else if (textarea.setSelectionRange) {
                    textarea.setSelectionRange(a, a + b)
                }
                textarea.scrollTop = scrollPosition;
                textarea.focus()
            }
            function get() {
                textarea.focus();
                scrollPosition = textarea.scrollTop;
                if (document.selection) {
                    selection = document.selection.createRange().text;
                    if ($.browser.msie) {
                        var a = document.selection.createRange(),
                            rangeCopy = a.duplicate();
                        rangeCopy.moveToElementText(textarea);
                        caretPosition = -1;
                        while (rangeCopy.inRange(a)) {
                            rangeCopy.moveStart('character');
                            caretPosition++
                        }
                    } else {
                        caretPosition = textarea.selectionStart
                    }
                } else {
                    caretPosition = textarea.selectionStart;
                    selection = d.val().substring(caretPosition, textarea.selectionEnd)
                }
                return selection
            }
            function preview() {
                if (!previewWindow || previewWindow.closed) {
                    if (k.previewInWindow) {
                        previewWindow = window.open('', 'preview', k.previewInWindow)
                    } else {
                        iFrame = $('<iframe class="markItUpPreviewFrame"></iframe>');
                        if (k.previewPosition == 'after') {
                            iFrame.insertAfter(footer)
                        } else {
                            iFrame.insertBefore(header)
                        }
                        previewWindow = iFrame[iFrame.length - 1].contentWindow || frame[iFrame.length - 1]
                    }
                } else if (altKey === true) {
                    if (iFrame) {
                        iFrame.remove()
                    }
                    previewWindow.close();
                    previewWindow = iFrame = false
                }
                if (!k.previewAutoRefresh) {
                    refreshPreview()
                }
            }
            function refreshPreview() {
                if (previewWindow.document) {
                    try {
                        sp = previewWindow.document.documentElement.scrollTop
                    } catch (e) {
                        sp = 0
                    }
                    previewWindow.document.open();
                    previewWindow.document.write(renderPreview());
                    previewWindow.document.close();
                    previewWindow.document.documentElement.scrollTop = sp
                }
                if (k.previewInWindow) {
                    previewWindow.focus()
                }
            }
            function renderPreview() {
                if (k.previewParserPath !== '') {
                    $.ajax({
                        type: 'POST',
                        async: false,
                        url: k.previewParserPath,
                        data: k.previewParserVar + '=' + encodeURIComponent(d.val()),
                        success: function (a) {
                            phtml = localize(a, 1)
                        }
                    })
                } else {
                    if (!template) {
                        $.ajax({
                            async: false,
                            url: k.previewTemplatePath,
                            success: function (a) {
                                template = localize(a, 1)
                            }
                        })
                    }
                    phtml = template.replace(/<!-- content -->/g, d.val())
                }
                return phtml
            }
            function keyPressed(e) {
                shiftKey = e.shiftKey;
                altKey = e.altKey;
                ctrlKey = (!(e.altKey && e.ctrlKey)) ? e.ctrlKey : false;
                if (e.type === 'keydown') {
                    if (ctrlKey === true) {
                        li = $("a[accesskey=" + String.fromCharCode(e.keyCode) + "]", header).parent('li');
                        if (li.length !== 0) {
                            ctrlKey = false;
                            li.triggerHandler('mouseup');
                            return false
                        }
                    }
                    if (e.keyCode === 13 || e.keyCode === 10) {
                        if (ctrlKey === true) {
                            ctrlKey = false;
                            markup(k.onCtrlEnter);
                            return k.onCtrlEnter.keepDefault
                        } else if (shiftKey === true) {
                            shiftKey = false;
                            markup(k.onShiftEnter);
                            return k.onShiftEnter.keepDefault
                        } else {
                            markup(k.onEnter);
                            return k.onEnter.keepDefault
                        }
                    }
                    if (e.keyCode === 9) {
                        if (shiftKey == true || ctrlKey == true || altKey == true) {
                            return false
                        }
                        if (caretOffset !== -1) {
                            get();
                            caretOffset = d.val().length - caretOffset;
                            set(caretOffset, 0);
                            caretOffset = -1;
                            return false
                        } else {
                            markup(k.onTab);
                            return k.onTab.keepDefault
                        }
                    }
                }
            }
            init()
        })
    };
    $.fn.markItUpRemove = function () {
        return this.each(function () {
            $$ = $(this).unbind().removeClass('markItUpEditor');
            $$.parent('div').parent('div.markItUp').parent('div').replaceWith($$)
        })
    };
    $.markItUp = function (a) {
        var b = {
            target: false
        };
        $.extend(b, a);
        if (b.target) {
            return $(b.target).each(function () {
                $(this).focus();
                $(this).trigger('insertion', [b])
            })
        } else {
            $('textarea').trigger('insertion', [b])
        }
    }
})(jQuery);