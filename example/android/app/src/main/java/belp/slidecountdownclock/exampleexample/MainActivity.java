package belp.slidecountdownclock.exampleexample;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(flutterEngine);
+        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
+                .setMethodCallHandler(
+                    (call, result) -> {
+                        // Your existing code
+                }
+        );
  }
}
