library(shiny)
library(bslib)


server <- function(input, output) {
    output$tbl_1 <- renderUI({
        if (input$value_box %% 2 == 1) {
            card(
                class = "column_wrap",
                fluidRow(
                    class = "fluid_class",
                    column(3, "Процентная ставка:"),
                    column(3, "по согласованию"),
                    column(2, "от 10 000 руб.")
                ),
                fluidRow(
                    class = "fluid_class",
                    column(6, "Дополнительная информация", class = "card_row_1")
                ),
                fluidRow(
                    class = "fluid_class",
                    column(5, "Срок рассмотрения заяки:", class = "card_row_2"),
                    column(2, "до 10 дней")
                ),
                fluidRow(
                    column(6, "Необходимая документация:", class = "card_row_3")
                ),
                layout_column_wrap(
                    width = 1 / 2,
                    card(
                        class = "column_wrap",
                        fluidRow(
                            column(4, "Калькулятор:")
                        ),
                        fluidRow(
                            column(6, "Сумма"),
                            column(3, "4000 руб.")
                        ),
                        fluidRow(
                            column(6, "Срок"),
                            column(3, "12 мес.")
                        ),
                        fluidRow(
                            column(6, "Стоимость"),
                            column(3, "39,5 руб.")
                        ),
                        fluidRow(
                            column(6, "Итоговая стоимость"),
                            column(3, "4474 руб.")
                        )
                    ),
                    card(
                        class = "column_wrap",
                        "Описание: Финансирование затрат на создание (приобретение,
                        реконструкцию,модернизацию, строительство, капитальный ремонт)
                        основных средств, за исключением затрат на приобретение (реконструкцию,
                        модернизацию, строительство, капитальный ремонт) объектов недвижимости
                        для последующей сдачи в аренду, финансирование затрат на приобретение
                        нематериальных активов (франшизы)."
                    )
                )
            )
        }
    })

    output$tbl_alpha <- renderUI({
        if (input$value_box_10 %% 2 == 1) {
            card(
                fluidRow(
                    column(6, "Дополнительная информация", class = "card_row_1")
                ),
                fluidRow(
                    column(5, "Срок рассмотрения заяки:", class = "card_row_2"),
                    column(2, "до 2 дней")
                ),
                fluidRow(
                    column(5, "Предварительное решение:", class = "card_row_2"),
                    column(2, "за 1 час")
                ),
                fluidRow(
                    column(5, "Отсрочка:", class = "card_row_2"),
                    column(4, "до 15 до 180 дней")
                ),
                fluidRow(
                    column(6, "Необходимая документация:", class = "card_row_3")
                ),
                layout_column_wrap(
                    width = 1 / 2,
                    card(
                        fluidRow(
                            column(4, "Калькулятор:")
                        ),
                        fluidRow(
                            column(6, "Сумма"),
                            column(3, "4000 руб.")
                        ),
                        fluidRow(
                            column(6, "Срок"),
                            column(3, "12 мес.")
                        ),
                        fluidRow(
                            column(6, "Стоимость"),
                            column(3, "39,5 руб.")
                        ),
                        fluidRow(
                            column(6, "Итоговая стоимость"),
                            column(3, "4474 руб.")
                        )
                    ),
                    card(
                        "Цель кредита: приобретение товаров, работ и услуг у компаний-партнеров Альфа-Банка."
                    )
                )
            )
        }
    })
}
