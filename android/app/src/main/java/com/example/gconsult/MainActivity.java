package com.example.gconsult;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import java.util.*;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.gconsultmobile.app/app";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {

        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            final Map<String, Object> arguments = call.arguments();

                            if(call.method.equals("javaRules")) {
                                String value = (String) arguments.get("Cor");

                                if(value.equals("Transparente")) {
                                    result.success("YAY!");
                                }
                                else {
                                    result.success("NO!!!");
                                }
                            }
                        }
                );
    }
}

