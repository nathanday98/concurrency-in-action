#include <print>
#include <thread>

int main()
{
    std::thread thread{[](){
       std::print("hello from another thread\n");
    }};
    thread.join();
}
