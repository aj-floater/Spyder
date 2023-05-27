#pragma once

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <imgui/imgui.h>
#include <imgui/backends/imgui_impl_glfw.h>
#include <imgui/backends/imgui_impl_opengl3.h>

#include <string>

enum cube_num{
    CUBE_1,
    CUBE_2,
    CUBE_3,
    CUBE_4
};

class PropertyManager {
public:
    static void GuiStartup(){
        // feed inputs to dear imgui, start new frame
        // ImGui_ImplOpenGL3_NewFrame();
        // ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();
    }
    static void GuiEnd(){
        // Render dear imgui into screen
        ImGui::Render();
        // ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
    }
    // Variables
    static float directional_light[3];
    static bool invalid;
    static float delta_time;

    // Gui
    static void RenderGui(){
        // GuiStartup();

        // ImGui::Begin("Light");
        // ImGui::SliderFloat3("direction", directional_light, -1, 1);
        // ImGui::End();

        // GuiEnd();
    }
    static void ShowArmProperties(float start_point[3], float end_point[3], float *limb1_length, float *limb2_length, float *limb3_length){
        GuiStartup();

        ImGui::Begin("Arm");
        ImGui::DragFloat3("start_point", start_point, 0.01);
        ImGui::DragFloat3("end_point", end_point, 0.01);
        ImGui::Separator();
        ImGui::DragFloat("limb1_length", limb1_length, 0.01);
        ImGui::DragFloat("limb2_length", limb2_length, 0.01);
        ImGui::DragFloat("limb3_length", limb3_length, 0.01);
        ImGui::End();

        GuiEnd();
    }
};