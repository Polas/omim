package com.mapswithme.maps.maplayer.isolines;

import android.app.Application;
import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.mapswithme.maps.Framework;
import com.mapswithme.maps.MwmApplication;
import com.mapswithme.maps.base.Initializable;
import com.mapswithme.maps.maplayer.subway.OnIsolinesChangedListener;

public class IsolinesManager implements Initializable<Void>
{
  @NonNull
  private final OnIsolinesChangedListener mListener;

  public IsolinesManager(@NonNull Application application)
  {
    mListener = new OnIsolinesChangedListenerImpl(application);
  }

  public boolean isEnabled()
  {
    return Framework.nativeIsIsolinesLayerEnabled();
  }

  private void registerListener()
  {
    nativeAddListener(mListener);
  }

  public void setEnabled(boolean isEnabled)
  {
    if (isEnabled == isEnabled())
      return;

    Framework.nativeSetIsolinesLayerEnabled(isEnabled);
  }

  public void toggle()
  {
    setEnabled(!isEnabled());
  }

  @Override
  public void initialize(@Nullable Void aVoid)
  {
    registerListener();
  }

  @Override
  public void destroy()
  {
    // No op.
  }

  @NonNull
  public static IsolinesManager from(@NonNull Context context)
  {
    MwmApplication app = (MwmApplication) context.getApplicationContext();
    return app.getIsolinesManager();
  }

  private static native void nativeAddListener(@NonNull OnIsolinesChangedListener listener);
  private static native void nativeRemoveListener(@NonNull OnIsolinesChangedListener listener);
}
