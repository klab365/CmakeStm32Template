#pragma once

#include "main.h"
#include "led.h"

class Stm32Led : public LedInterface
{
    explicit Stm32Led(GPIO_TypeDef *t_gpio, uint16_t t_pin)
        : gpio(t_gpio), pin(t_pin)
    {
    }

    void on()
    {
        HAL_GPIO_WritePin(gpio, pin, GPIO_PIN_SET);
    }

    void off()
    {
        HAL_GPIO_WritePin(gpio, pin, GPIO_PIN_RESET);
    }

    void toggle()
    {
        HAL_GPIO_TogglePin(gpio, pin);
    }

    bool isOn()
    {
        return HAL_GPIO_ReadPin(gpio, pin);
    }

private:
    GPIO_TypeDef *gpio;
    uint16_t pin;
};