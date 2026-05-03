package org.qtproject.example.appUniDemo;

import android.os.Bundle;
import android.util.Log;
import android.view.View;

import org.qtproject.qt.android.bindings.QtActivity;

import androidx.core.view.ViewCompat;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsCompat;

public class UniDemoActivity extends QtActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);

        final View content = findViewById(android.R.id.content);
        if (content != null) {
            ViewCompat.setOnApplyWindowInsetsListener(content, (view, insets) -> {
                int top = insets.getInsets(WindowInsetsCompat.Type.statusBars()).top;
                int bottom = insets.getInsets(WindowInsetsCompat.Type.navigationBars()).bottom;

                Log.d("UniDemoActivity", "Insets top=" + top + " bottom=" + bottom);

                view.setPadding(0, top, 0, bottom);
                return insets;
            });

            ViewCompat.requestApplyInsets(content);
        } else {
            Log.w("UniDemoActivity", "android.R.id.content was null");
        }
    }
}
