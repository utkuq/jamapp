import 'dart:convert';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamapp/gemini/api_key.dart';

geminiModel(XFile selectedImage) async {
  //gemini
  late GenerativeModel geminiVisionProModel;
  late GenerativeModel geminiProModel;

  //String myApi = api_key;
  final apiKey = api_key;
  if (apiKey == 'key not found') {
    throw InvalidApiKey(
      'Key not found in environment. Please add an API key.',
    );
  }

  geminiVisionProModel = GenerativeModel(
    model: 'gemini-pro-vision',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      temperature: 0.4,
      topK: 32,
      topP: 1,
      maxOutputTokens: 4096,
    ),
    safetySettings: [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
    ],
  );

  geminiProModel = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      temperature: 0.4,
      topK: 32,
      topP: 1,
      maxOutputTokens: 4096,
    ),
    safetySettings: [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
    ],
  );

  final image = await File(selectedImage.path).readAsBytes();

  final prompt = TextPart("""
You are an Artificial Intelligence bot that will take a picture of food ingredients from the user and create the name and recipe of a dish that can be made and the steps to make them in Turkish language.
The recipe should only contain real, edible ingredients. Adhere to food safety and handling best practices like ensuring that poultry is fully cooked.
If there are no images attached, or if the image does not contain food items, respond exactly with: "You have entered an invalid photo."
Do not repeat any ingredients.
List out any ingredients that are potential allergens.
Provide a summary of how many people the recipe will serve and the the nutritional information per serving.
Give the information in the following order:
title
ingredients
description
instructions
cuisine
allergens
servings
calories
fat
carbohydrates
protein
Do not forget that each output should be in Turkish and do not give output as json or markdown syntax.
""");
  final imagePart = [DataPart('image/jpeg', image)];

  final response = await geminiVisionProModel.generateContent([
    Content.multi([prompt, ...imagePart])
  ]);

  print(response.text);
  print("==================================================");

  return response;
}
