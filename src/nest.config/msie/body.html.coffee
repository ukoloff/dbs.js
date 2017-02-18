###
Real HTML body
###
module.exports = without ->
  h1 'Параметры раскроя'

  form -> table -> tr ->
    td ->
      fieldset ->
        legend 'Расстояния, мм'
        label 'Между деталями', br, ->
          input
            name: 'gap'
            type: 'number'
            min: 0
            required: true
        do br
        label 'До края листа', br, ->
          input
            name: 'border'
            type: 'number'
            min: 0
            required: true
      fieldset ->
        legend 'Качество раскроя'
        label ->
          input
            type: 'radio'
            name: 'time'
            value: 6
          text ' Быстрый раскрой'
        do br
        label ->
          input
            type: 'radio'
            name: 'time'
            value: 60
          text ' Стандартный раскрой'
        do br
        label ->
          input
            type: 'radio'
            name: 'time'
            value: 6
          text ' Качественный раскрой'
    td ->
      fieldset ->
        legend 'Допустимые вращения'
        label ->
          input
            type: 'radio'
            name: 'rotate'
            value: 0
          text ' Без поворота'
        do br
        label ->
          input
            type: 'radio'
            name: 'rotate'
            value: 1
          text ' Произвольное'
        do br
        label ->
          input
            type: 'radio'
            name: 'rotate'
            value: 90
          text ' На 90 градусов'
        do br
        label ->
          input
            type: 'radio'
            name: 'rotate'
            value: 180
          text ' На 180 градусов'

      fieldset ->
        legend 'Зеркальное отражение'

        label ->
          input
            type: 'checkbox'
            name: 'mirror'
            value: 0
          text ' Допустимо'

      p ->
        input
          type: 'submit'
          value: 'Сохранить настройки'
