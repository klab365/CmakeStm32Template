#pragma once

class LedInterface {
 public:
  virtual void on() = 0;
  virtual void off() = 0;
  virtual void toggle() = 0;
  virtual bool isOn() = 0;
};
