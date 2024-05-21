library(shiny)
library(bslib)


server <- function(input, output) {
    output$tbl_1 <- renderUI({
        if (input$value_box %% 2 == 1) {
            card(
                fluidRow(
                    column(4, "Процентная ставка:"),
                    column(2, "по согласованию"),
                    column(2, "от 10 000 руб.")
                ),
                fluidRow(
                    column(6, "Дополнительная информация", class = "card_row_1")
                ),
                fluidRow(
                    column(5, "Срок рассмотрения заяки:", class = "card_row_2"),
                    column(2, "до 10 дней")
                ),
                fluidRow(
                    column(4, "Необходимая документация:", class = "card_row_3")
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

    output$tbl_2 <- renderUI({
        if (input$value_box_1 > 0) {
            colnames(tbl_1) <= NULL
            tbl_1[2, ]
        }
    })

    output$tbl_3 <- renderUI({
        if (input$value_box_2 > 0) {
            colnames(tbl_1) <= NULL
            tbl_1[3, ]
        }
    })

    output$tbl_4 <- renderUI({
        if (input$value_box_3 > 0) {
            colnames(tbl_1) <= NULL
            tbl_1[4, ]
        }
    })

    output$tbl_5 <- renderUI({
        if (input$value_box_4 > 0) {
            colnames(tbl_1) <= NULL
            tbl_1[5, ]
        }
    })

    output$tbl_6 <- renderUI({
        if (input$value_box_5 > 0) {
            colnames(tbl_1) <= NULL
            tbl_1[6, ]
        }
    })

    output$tbl_names <- renderTable({
        na.omit(tbl_1[names(tbl_1), ])
    })
}
