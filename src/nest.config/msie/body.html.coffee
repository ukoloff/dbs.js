###
Real HTML body
###
module.exports = without ->
  h1 'Параметры раскроя'

  group = (title, content)->
    fieldset (-> legend title), content

  radio = (options, name, title)->
    group title, ->
      for k, v of options
        if next
          do br
        label ->
          input
            type: 'radio'
            name: name
            value: k
            checked: k == "#{@[name]}"
          text ' ', v
        next = 1
      return
  numbers = (options, title)->
    group title, ->
      for k, v of options
        if next
          do br
        label v, br, ->
          input
            name: k
            value: @[k]
            type: 'number'
            min: 0
            required: true
        next = 1
      return

  form -> table -> tr ->
    td ->
      numbers
        gap: 'Между деталями'
        border: 'До края листа'
        'Расстояния, мм'
      radio
        6: 'Быстрый раскрой'
        60:'Стандартный раскрой'
        600: 'Качественный раскрой'
        'time'
        'Качество раскроя'
    td ->
      radio
        0: 'Без поворота'
        1: 'Произвольное'
        90: 'На 90 градусов'
        180: 'На 180 градусов'
        'rotate'
        'Допустимые вращения'
      group 'Зеркальное отражение', ->
        label ->
          input
            type: 'checkbox'
            name: 'mirror'
            checked: !!@mirror
          text ' Допустимо'

      p ->
        input
          type: 'submit'
          value: 'Сохранить настройки'
